<?php

namespace App\Http\Controllers;

use App\Helper\ModelHelper;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;
use Illuminate\Support\Facades\Config;
use Illuminate\Database\QueryException; // Import QueryException

class DatabaseController extends Controller
{
    /**
     * Get database schema information, including foreign key relationships and driver.
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function getSchema()
    {
        try {
            $dbConnection = Config::get('database.default'); // Get the default database connection name
            $driver = Config::get("database.connections.{$dbConnection}.driver"); // Get the driver type
            $databaseName = Config::get("database.connections.{$dbConnection}.database"); // Get the database name

            $tables = [];

            // Use DB::select based on the database driver to get table names
            if ($driver === 'mysql') {
                $tables = array_map('current', DB::select('SHOW TABLES'));
            } elseif ($driver === 'sqlite') {
                $tables = array_map('current', DB::select("SELECT name FROM sqlite_master WHERE type='table' AND name NOT LIKE 'sqlite_%';"));
            } elseif ($driver === 'pgsql') {
                $tables = array_map('current', DB::select("SELECT tablename FROM pg_tables WHERE schemaname = 'public';"));
            } else {
                return response()->json([
                    'success' => false,
                    'message' => "Unsupported database driver for fetching tables: {$driver}",
                ], 501);
            }

            $schema = [];

            // Iterate through each table to get column and foreign key information
            foreach ($tables as $table) {
                $columnDetails = [];
                $foreignKeys = [];

                // Fetch column details using raw SQL based on the driver
                if ($driver === 'mysql') {
                    $columnInfo = DB::select("SELECT COLUMN_NAME, DATA_TYPE, IS_NULLABLE FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = ? AND TABLE_NAME = ?", [$databaseName, $table]);
                    foreach ($columnInfo as $col) {
                        $columnDetails[] = [
                            'name' => $col->COLUMN_NAME,
                            'type' => $col->DATA_TYPE,
                            'nullable' => ($col->IS_NULLABLE === 'YES'),
                        ];
                    }

                    // Fetch foreign key constraints for MySQL
                    $fkInfo = DB::select("SELECT
                                            COLUMN_NAME,
                                            REFERENCED_TABLE_NAME,
                                            REFERENCED_COLUMN_NAME
                                          FROM
                                            information_schema.KEY_COLUMN_USAGE
                                          WHERE
                                            TABLE_SCHEMA = ? AND
                                            TABLE_NAME = ? AND
                                            REFERENCED_TABLE_NAME IS NOT NULL", [$databaseName, $table]);

                    foreach ($fkInfo as $fk) {
                        $foreignKeys[] = [
                            'column' => $fk->COLUMN_NAME,
                            'references_table' => $fk->REFERENCED_TABLE_NAME,
                            'references_column' => $fk->REFERENCED_COLUMN_NAME,
                        ];
                    }

                } elseif ($driver === 'sqlite') {
                    // Fetch column details for SQLite
                    $columnInfo = DB::select("PRAGMA table_info(?)", [$table]);
                     foreach ($columnInfo as $col) {
                        $columnDetails[] = [
                            'name' => $col->name,
                            'type' => $col->type,
                            'nullable' => ($col->notnull === 0),
                        ];
                    }

                    // Fetch foreign key constraints for SQLite
                    $fkInfo = DB::select("PRAGMA foreign_key_list(?)", [$table]);
                    foreach ($fkInfo as $fk) {
                         $foreignKeys[] = [
                            'column' => $fk->from,
                            'references_table' => $fk->table,
                            'references_column' => $fk->to,
                        ];
                    }

                } elseif ($driver === 'pgsql') {
                    // Fetch column details for PostgreSQL
                     $columnInfo = DB::select("SELECT column_name, data_type, is_nullable FROM information_schema.columns WHERE table_schema = 'public' AND table_name = ?", [$table]);
                     foreach ($columnInfo as $col) {
                        $columnDetails[] = [
                            'name' => $col->column_name,
                            'type' => $col->data_type,
                            'nullable' => ($col->is_nullable === 'YES'),
                        ];
                    }

                    // Fetch foreign key constraints for PostgreSQL
                    $fkInfo = DB::select("SELECT
                                            kcu.column_name,
                                            tc.constraint_type,
                                            ccu.table_name AS foreign_table_name,
                                            ccu.column_name AS foreign_column_name
                                          FROM
                                            information_schema.table_constraints AS tc
                                          JOIN information_schema.key_column_usage AS kcu
                                            ON tc.constraint_name = kcu.constraint_name
                                          JOIN information_schema.constraint_column_usage AS ccu
                                            ON ccu.constraint_name = tc.constraint_name
                                          WHERE tc.constraint_type = 'FOREIGN KEY'
                                            AND tc.table_schema = 'public'
                                            AND tc.table_name = ?", [$table]);

                    foreach ($fkInfo as $fk) {
                         $foreignKeys[] = [
                            'column' => $fk->column_name,
                            'references_table' => $fk->foreign_table_name,
                            'references_column' => $fk->foreign_column_name,
                        ];
                    }
                } else {
                    return response()->json([
                        'success' => false,
                        'message' => "Unsupported database driver for fetching columns/foreign keys: {$driver}",
                    ], 501);
                }

                $schema[] = [
                    'table_name' => $table,
                    'columns' => $columnDetails,
                    'foreign_keys' => $foreignKeys,
                ];
            }

            // Include the driver in the response
            return response()->json([
                'success' => true,
                'driver' => $driver, // Add the driver here
                'schema' => $schema,
                'message' => 'Database schema fetched successfully.',
            ]);

        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => 'Error fetching database schema.',
                'error' => $e->getMessage()
            ], 500);
        }
    }

    /**
     * Execute a given SQL query against the database.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function executeQuery(Request $request)
    {
        // Validate that the 'query' parameter is present in the request
        $request->validate([
            'query' => 'required|string',
        ]);

        $sqlQuery = $request->input('query');

        // Basic Security Check: Prevent potentially harmful queries (e.g., INSERT, UPDATE, DELETE, DROP)
        // This is a simple check and should be augmented with more robust validation in a real application.
        $forbidden_keywords = ['INSERT', 'UPDATE', 'DELETE', 'DROP', 'ALTER', 'CREATE', 'TRUNCATE'];
        $upperCaseQuery = strtoupper($sqlQuery);

        foreach ($forbidden_keywords as $keyword) {
            if (str_contains($upperCaseQuery, $keyword)) {
                return response()->json([
                    'success' => false,
                    'message' => 'Execution of this type of SQL query is not allowed via this endpoint.',
                    'error' => 'Forbidden SQL keyword detected.'
                ], 403); // Forbidden
            }
        }

        try {
            // Execute the query. DB::select is suitable for SELECT statements.
            // For other types (like INSERT/UPDATE/DELETE if you were to allow them),
            // you would use DB::statement or DB::affectingRows.
            $results = DB::select($sqlQuery);

            // Return the results as a JSON response
            return response()->json([
                'success' => true,
                'results' => $results,
                'message' => 'SQL query executed successfully.'
            ]);

        } catch (QueryException $e) {
            // Catch specific database query exceptions
            return response()->json([
                'success' => false,
                'message' => 'Error executing SQL query.',
                'error' => $e->getMessage(),
                'sql_query' => $sqlQuery // Include the query for debugging
            ], 400); // Bad Request or other appropriate client error status
        } catch (\Exception $e) {
            // Catch any other unexpected exceptions
            return response()->json([
                'success' => false,
                'message' => 'An unexpected error occurred during query execution.',
                'error' => $e->getMessage(),
                'sql_query' => $sqlQuery // Include the query for debugging
            ], 500); // Internal Server Error
        }
    }


    public function getModelInfo()
    {
        $models = ModelHelper::getAllModels();
        $modelData = [];

        foreach ($models as $modelClass) {
            $model = new $modelClass;

            $modelData[] = [
                'model' => class_basename($modelClass),
                'table' => $model->getTable(),
                'fillable' => $model->getFillable(),
                'primary_key' => $model->getKeyName(),
                // Add more if needed: guarded, timestamps, casts, etc.
            ];
        }

        return response()->json([
            'success' => true,
            'models' => $modelData,
        ]);
    }
}

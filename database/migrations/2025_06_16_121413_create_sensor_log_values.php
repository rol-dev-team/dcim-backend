<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;
use Illuminate\Support\Facades\DB;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        /* ---------- 1.  PostgreSQL-safe partitioned master table ---------- */
        if (!Schema::hasTable('sensor_log_values')) {
            DB::statement(
                'CREATE TABLE sensor_log_values (
                    id         BIGSERIAL,
                    sensor_id  BIGINT       NOT NULL,
                    value      VARCHAR(255) NOT NULL,
                    created_at TIMESTAMP    NOT NULL DEFAULT NOW(),
                    updated_at TIMESTAMP    NOT NULL DEFAULT NOW(),
                    PRIMARY KEY (id, created_at)          -- partition column must be in PK
                ) PARTITION BY RANGE (created_at);'
            );
        }

        /* ---------- 2.  weekly partitions (create only if missing) -------- */
        foreach ($this->weeklyRanges(5) as [$name, $start, $end]) {
            $exists = DB::select(
                "SELECT 1 FROM pg_class c
                 JOIN pg_namespace n ON n.oid = c.relnamespace
                 WHERE c.relname = ? AND n.nspname = current_schema()",
                [$name]
            );
            if (!$exists) {
                DB::statement(
                    "CREATE TABLE {$name}
                     PARTITION OF sensor_log_values
                     FOR VALUES FROM ('{$start}') TO ('{$end}');"
                );
            }
        }

        /* ---------- 3.  helper index (create only once) ------------------ */
        $indexExists = DB::select(
            "SELECT 1 FROM pg_indexes
             WHERE schemaname = current_schema()
               AND tablename  = 'sensor_log_values'
               AND indexname  = 'sensor_log_values_sensor_created_idx'"
        );
        if (!$indexExists) {
            DB::statement(
                'CREATE INDEX sensor_log_values_sensor_created_idx
                 ON sensor_log_values (sensor_id, created_at);'
            );
        }
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('sensor_log_values');
    }

    /**
     * Helper function to generate weekly partition ranges.
     *
     * @param int $numWeeks
     * @return array
     */
    protected function weeklyRanges(int $numWeeks = 5): array
    {
        $monday = new \DateTimeImmutable('Monday this week 00:00:00');
        $ranges = [];

        for ($i = 0; $i < $numWeeks; $i++) {
            $start = $monday->modify("+{$i} weeks");
            $end   = $start->modify('+1 week');

            $ranges[] = [
                'sensor_log_values_p'.$start->format('Ymd'),
                $start->format('Y-m-d H:i:s'),
                $end->format('Y-m-d H:i:s'),
            ];
        }

        return $ranges;
    }
};

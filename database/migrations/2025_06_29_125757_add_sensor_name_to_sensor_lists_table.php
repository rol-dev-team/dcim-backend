<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        if (! Schema::hasColumn('sensor_lists', 'sensor_name')) {
            Schema::table('sensor_lists', function (Blueprint $table) {
                $table->string('sensor_name', 255)->after('blink_status');
            });
        }
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        if (Schema::hasColumn('sensor_lists', 'sensor_name')) {
            Schema::table('sensor_lists', function (Blueprint $table) {
                $table->dropColumn('sensor_name');
            });
        }
    }
};

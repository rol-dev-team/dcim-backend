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
        if (! Schema::hasColumn('do_operation_triggers', 'off_duration')) {
            Schema::table('do_operation_triggers', function (Blueprint $table) {
                $table->unsignedBigInteger('off_duration')->nullable()->after('duration');
            });
        }
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        if (Schema::hasColumn('do_operation_triggers', 'off_duration')) {
            Schema::table('do_operation_triggers', function (Blueprint $table) {
                $table->dropColumn('off_duration');
            });
        }
    }
};

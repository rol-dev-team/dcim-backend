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
        Schema::table('device_lists', function (Blueprint $table) {
            $table->string('control_topic', 255)->nullable()->after('secret_key');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('device_lists', function (Blueprint $table) {
            $table->dropColumn('control_topic');
        });
    }
};

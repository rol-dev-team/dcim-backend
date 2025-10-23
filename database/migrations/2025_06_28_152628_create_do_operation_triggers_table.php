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
        Schema::create('do_operation_triggers', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('rule')->nullable();
            $table->unsignedBigInteger('sensor_id');
            $table->unsignedBigInteger('mode_id');
            $table->unsignedBigInteger('repeat_id')->nullable();
            $table->json('day_id')->nullable();
            $table->string('on_time')->nullable();
            $table->string('off_time')->nullable();
            $table->unsignedBigInteger('duration')->nullable();
            $table->unsignedBigInteger('off_duration')->nullable();
            $table->date('dateFrom')->nullable();
            $table->date('dateTo')->nullable();
            $table->unsignedTinyInteger('status');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('do_operation_triggers');
    }
};

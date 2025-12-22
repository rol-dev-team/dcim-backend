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
        Schema::create('sensor_real_time_values', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('sensor_id')->unique();
            $table->string('value', 255);
            $table->timestamp('received_at')->nullable();
            $table->string('topic', 255)->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('sensor_real_time_values');
    }
};

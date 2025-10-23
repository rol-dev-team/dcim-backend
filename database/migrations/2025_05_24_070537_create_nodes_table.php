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
        Schema::create('nodes', function (Blueprint $table) {
            $table->id();
            $table->foreignId('data_center_id')->constrained('data_center_creations');
            $table->string('node_id');
            $table->string('node_type')->nullable();
            $table->json('position')->nullable();
            $table->json('data')->nullable();
            $table->json('style')->nullable();
            $table->timestamps();

            $table->index(['data_center_id', 'node_id']);
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('nodes');
    }
};

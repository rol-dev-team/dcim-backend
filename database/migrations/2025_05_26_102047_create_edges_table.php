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
        Schema::create('edges', function (Blueprint $table) {
            $table->id();
            $table->foreignId('diagram_id')->constrained()->onDelete('cascade'); // Foreign key to diagrams table
            $table->foreignId('data_center_id')->constrained('data_center_creations')->onDelete('cascade'); // Link to data center
            $table->string('edge_id')->unique(); // Unique ID from React Flow
            $table->string('source');
            $table->string('target');
            $table->string('source_handle')->nullable();
            $table->string('target_handle')->nullable();
            $table->string('type')->default('default');
            $table->json('style')->nullable();
            $table->json('marker_end')->nullable();
            $table->json('data')->nullable(); // For any custom edge data
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('edges');
    }
};

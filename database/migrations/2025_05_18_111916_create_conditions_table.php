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
        Schema::create('conditions', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('asset_id');
            $table->string('parameter_name'); // 'status'
            $table->string('condition_type'); // 'equals', 'greater_than', etc.
            $table->string('trigger_value'); // '0', '1', etc.
            $table->string('color'); // 'green', 'red', 'yellow'
            $table->timestamps();

            $table->foreign('asset_id')->references('id')->on('sld_assets')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('conditions');
    }
};

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
        Schema::create('sld_assets', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('datacenter_id');
            $table->string('name');
            $table->string('type'); // DG, ATS, UPS, etc.
            $table->integer('x_pos')->default(0);
            $table->integer('y_pos')->default(0);
            $table->timestamps();

            $table->foreign('datacenter_id')->references('id')->on('data_center_creations')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('sld_assets');
    }
};

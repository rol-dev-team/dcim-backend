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
        Schema::create('rak_datacenter_mappings', function (Blueprint $table) {
                $table->bigIncrements('id');
                $table->unsignedInteger('data_center_id');
                $table->unsignedInteger('rak_id');
                $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('rak_datacenter_mappings');
    }
};

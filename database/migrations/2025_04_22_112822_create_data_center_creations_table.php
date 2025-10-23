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
        Schema::create('data_center_creations', function (Blueprint $table) {
            $table->id();
            $table->string('name', 255);
            $table->string('division', 255);
            $table->string('address', 255);
            $table->boolean('email_notification')->default(0);
            $table->boolean('sms_notification')->default(0);
            $table->integer('owner_type_id');
            $table->boolean('status')->default(1);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('data_center_creations');
    }
};

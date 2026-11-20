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
        Schema::create('verification_codes', function (Blueprint $table) {
            $table->id();
            $table->uuid()->unique()->index();
            $table->string('email');
            $table->string('code',6);
            $table->timestamp('expires_at');
            $table->integer('req_count',false,true)->default(1);
            $table->timestamp('blocked_until')->nullable();
            $table->timestamp('duration')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('verification_codes');
    }
};

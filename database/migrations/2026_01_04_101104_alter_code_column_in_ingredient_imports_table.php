<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::table('ingredient_imports', function (Blueprint $table) {
            // drop unique index first
            $table->dropUnique(['code']);

            // make column nullable
            $table->string('code')->nullable()->change();
        });
    }

    public function down(): void
    {
        Schema::table('ingredient_imports', function (Blueprint $table) {
            $table->string('code')->unique()->nullable(false)->change();
        });
    }
};

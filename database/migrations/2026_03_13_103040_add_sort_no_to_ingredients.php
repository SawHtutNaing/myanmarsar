<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;
use App\Models\Ingredient;

return new class extends Migration
{
    public function up(): void
    {
        Schema::table('ingredients', function (Blueprint $table) {
            $table->unsignedInteger('sort_no')->default(0)->after('id');
        });

        // Seed sort_no for existing records
        Ingredient::orderBy('id')->each(function ($ingredient, $index) {
            $ingredient->timestamps = false;
            $ingredient->update(['sort_no' => $index + 1]);
        });
    }

    public function down(): void
    {
        Schema::table('ingredients', function (Blueprint $table) {
            $table->dropColumn('sort_no');
        });
    }
};

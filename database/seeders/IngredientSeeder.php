<?php

namespace Database\Seeders;

use App\Models\Ingredient;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class IngredientSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        Ingredient::create(['name' => 'Chicken', 'unit' => 'kg', 'quantity' => 10, 'unit_price' => 5.00]);
        Ingredient::create(['name' => 'Rice', 'unit' => 'kg', 'quantity' => 20, 'unit_price' => 1.50]);
        Ingredient::create(['name' => 'Onion', 'unit' => 'kg', 'quantity' => 15, 'unit_price' => 1.00]);
        Ingredient::create(['name' => 'Garlic', 'unit' => 'kg', 'quantity' => 10, 'unit_price' => 2.00]);
        Ingredient::create(['name' => 'Tomato', 'unit' => 'kg', 'quantity' => 12, 'unit_price' => 2.50]);
    }
}

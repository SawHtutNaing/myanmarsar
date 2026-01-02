<?php

namespace Database\Seeders;

use App\Models\FoodItem;
use App\Models\Ingredient;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class FoodItemSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $chicken = Ingredient::where('name', 'Chicken')->first();
        $rice = Ingredient::where('name', 'Rice')->first();
        $onion = Ingredient::where('name', 'Onion')->first();

        $chickenBiryani = FoodItem::create([
            'name' => 'Chicken Biryani',
            'price' => 12.50,
            'description' => 'A delicious chicken and rice dish.',
        ]);
        $chickenBiryani->ingredients()->attach([
            $chicken->id => ['quantity' => 0.5],
            $rice->id => ['quantity' => 0.2],
            $onion->id => ['quantity' => 0.1],
        ]);

        $friedRice = FoodItem::create([
            'name' => 'Fried Rice',
            'price' => 8.00,
            'description' => 'A classic fried rice.',
        ]);
        $friedRice->ingredients()->attach([
            $rice->id => ['quantity' => 0.3],
            $onion->id => ['quantity' => 0.05],
        ]);
    }
}

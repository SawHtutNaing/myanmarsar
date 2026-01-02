<?php

namespace Database\Seeders;

use App\Models\FoodItem;
use App\Models\Order;
use App\Models\OrderItem;
use App\Models\User;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class OrderSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $waiter = User::where('email', 'waiter@example.com')->first();
        $chickenBiryani = FoodItem::where('name', 'Chicken Biryani')->first();
        $friedRice = FoodItem::where('name', 'Fried Rice')->first();

        $order1 = Order::create([
            'user_id' => $waiter->id,
            'table_number' => 1,
            'status' => 'completed',
            'total_price' => 20.50,
        ]);
        OrderItem::create([
            'order_id' => $order1->id,
            'food_item_id' => $chickenBiryani->id,
            'quantity' => 1,
            'price' => $chickenBiryani->price,
        ]);
        OrderItem::create([
            'order_id' => $order1->id,
            'food_item_id' => $friedRice->id,
            'quantity' => 1,
            'price' => $friedRice->price,
        ]);

        $order2 = Order::create([
            'user_id' => $waiter->id,
            'table_number' => 2,
            'status' => 'pending',
            'total_price' => 12.50,
        ]);
        OrderItem::create([
            'order_id' => $order2->id,
            'food_item_id' => $chickenBiryani->id,
            'quantity' => 1,
            'price' => $chickenBiryani->price,
        ]);
    }
}

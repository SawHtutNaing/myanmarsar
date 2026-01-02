<?php

namespace Database\Seeders;

use App\Models\Role;
use App\Models\User;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;

class UserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $adminRole = Role::where('name', 'admin')->first();
        $waiterRole = Role::where('name', 'waiter')->first();
        $kitchenRole = Role::where('name', 'kitchen')->first();

        $admin = User::create([
            'name' => 'Admin User',
            'email' => 'admin@example.com',
            'password' => Hash::make('password'),
        ]);
        $admin->roles()->attach($adminRole);

        $waiter = User::create([
            'name' => 'Waiter User',
            'email' => 'waiter@example.com',
            'password' => Hash::make('password'),
        ]);
        $waiter->roles()->attach($waiterRole);

        $kitchen = User::create([
            'name' => 'Kitchen User',
            'email' => 'kitchen@example.com',
            'password' => Hash::make('password'),
        ]);
        $kitchen->roles()->attach($kitchenRole);
    }
}

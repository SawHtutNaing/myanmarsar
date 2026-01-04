<?php

namespace Database\Seeders;

use App\Models\Role;
use App\Models\User;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\DB;

class UserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
          // Disable foreign key checks
        DB::statement('SET FOREIGN_KEY_CHECKS=0;');

        // Truncate table
        User::truncate();

        // Enable foreign key checks
        DB::statement('SET FOREIGN_KEY_CHECKS=1;');

        $adminRole = Role::where('name', 'admin')->first();
        $waiterRole = Role::where('name', 'waiter')->first();
        $kitchenRole = Role::where('name', 'kitchen')->first();
        $supplierRole = Role::where('name', 'supplier')->first();

        $admin = User::create([
            'name' => 'Admin User',
            'email' => 'admin@example.com',
            'password' => Hash::make('password'),
        ]);
        $admin->roles()->attach($adminRole);


              $gm = User::create([
            'name' => 'GM',
            'email' => 'gm@example.com',
            'password' => Hash::make('password'),
        ]);
        $gm->roles()->attach($adminRole);


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


         $supplier = User::create([
            'name' => 'supplier User',
            'email' => 'supplier@example.com',
            'password' => Hash::make('password'),
        ]);
        $supplier->roles()->attach($supplierRole);

    }
}

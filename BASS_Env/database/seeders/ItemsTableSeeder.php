<?php
namespace Database\Seeders;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class ItemsTableSeeder extends Seeder
{
    public function run()
    {
        DB::table('items')->insert([
            ['name' => 'Example Item 1', 'price' => 99.99, 'stock' => 10],
            ['name' => 'Example Item 2', 'price' => 149.99, 'stock' => 5],
            // Add more items as needed.
        ]);
    }
}
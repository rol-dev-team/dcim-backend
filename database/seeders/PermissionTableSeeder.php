<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Spatie\Permission\Models\Permission;
use Illuminate\Support\Facades\Route;

class PermissionTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {

        $routes = Route::getRoutes();

        foreach ($routes as $route) {
            $name = $route->getName();

            if ($name && !Permission::where('name', $name)->where('guard_name', 'web')->exists()) {
                Permission::create([
                    'name' => $name,
                    'guard_name' => 'web'
                ]);
            }
        }
    }
}

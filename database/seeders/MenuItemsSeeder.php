<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class MenuItemsSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run()
    {
        $menus = [
            [
                'title' => 'Main Dashboard',
                'icon' => 'home',
                'path' => '/admin/main-dashboard',
                'permission_key' => 'view-dashboard',
                'user_types' => [1, 2, 3, 4],
                'order' => 1
            ],
            [
                'title' => 'User Management',
                'icon' => 'users',
                'permission_key' => 'manage-users',
                'user_types' => [1, 2],
                'order' => 5,
                'submenu' => [
                    [
                        'title' => 'User List',
                        'path' => '/admin/users',
                        'permission_key' => 'view-users'
                    ]
                ]
            ]
        ];

        foreach ($menus as $menu) {
            $submenu = $menu['submenu'] ?? null;
            unset($menu['submenu']);

            $menuItem = MenuItem::create($menu);

            if ($submenu) {
                foreach ($submenu as $sub) {
                    MenuItem::create([
                        ...$sub,
                        'parent_id' => $menuItem->id,
                        'order' => $menuItem->order
                    ]);
                }
            }
        }
    }
}

<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\User;
use Spatie\Permission\Models\Role;
use Spatie\Permission\Models\Permission;

class CreateAdminUserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $user = User::create([
            'user_type_id' => '1',
            'username' => 'dcim',
            'fullname' => 'DCIM Admin',
            'mobile' => '018162345',
            'email' => 'admin@gmail.com',
            'dept_id' => '1',
            'role_id' => '8',
            'password' => bcrypt('123456'),
            'status' => '1',
            'is_email' => '1',
            'is_sms' => '1',
            'password_change' => '1',
        ]);

        $role = Role::create(['name' => 'Admin']);

        $permissions = Permission::pluck('id','id')->all();

        $role->syncPermissions($permissions);

        $user->assignRole([$role->id]);
    }
}

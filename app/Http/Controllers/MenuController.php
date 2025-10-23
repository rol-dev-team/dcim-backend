<?php

namespace App\Http\Controllers;

use App\Models\MenuItem;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Cache;

class MenuController extends Controller
{
    // MenuController.php
    public function getUserMenu()
    {
        $user = auth()->user();

        return Cache::remember('user-menu-'.$user->id, now()->addHours(1), function() use ($user) {
            return MenuItem::with(['children' => function($query) use ($user) {
                $query->orderBy('order')
                    ->where(function($q) use ($user) {
                        $q->whereNull('permission')
                            ->orWhere('permission', '')
                            ->orWhereHas('permission', function($q) use ($user) {
                                $q->whereHas('roles', function($q) use ($user) {
                                    $q->whereIn('id', $user->roles->pluck('id'));
                                });
                            });
                    });
            }])
                ->whereNull('parent_id')
                ->orderBy('order')
                ->get()
                ->toArray();
        });
    }
}

<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use Symfony\Component\HttpFoundation\Response;

class AutoCanMiddleware
{
    public function handle(Request $request, Closure $next): Response
    {
        $routeName = Route::currentRouteName();

        if ($routeName && !$request->user()->can($routeName)) {
            return response()->json(['message' => 'Unauthorized - permission denied.'], 403);
        }

        return $next($request);
    }
}



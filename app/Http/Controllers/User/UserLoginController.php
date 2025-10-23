<?php

namespace App\Http\Controllers\User;

use App\Http\Controllers\Controller;
use App\Models\User;
use App\Helpers\ApiResponse;
use App\Models\UserType;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class UserLoginController extends Controller
{

    public function FetchUser()
    {
        $users = User::all();
        return response()->json($users);
    }



    public function login(Request $request)
    {
        try {
            $credentials = $request->only('username', 'password');

            if (Auth::attempt($credentials)) {
                $user = Auth::user();

                if ($user->status !== 1) {
                    Auth::logout();
                    return ApiResponse::error([], 'Your account is not active.', 403);
                }



                return ApiResponse::success($user,  'Login successful',200);
            } else {
                return ApiResponse::success('Error', 'Invalid credentials', 409);
            }
        } catch (Exception $e) {

            return ApiResponse::error($e->getMessage(), "Error", 500);
        }
    }



    public function Logout(Request $request)
    {
        Auth::logout();


        Session::invalidate();


        Session::regenerateToken();

        return ApiResponse::success(null, "Logout successful", 200);
    }
}

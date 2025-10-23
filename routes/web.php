<?php

use Illuminate\Support\Facades\Route;
use Inertia\Inertia;
use App\Http\Controllers\User\UserLoginController;
use App\Http\Controllers\User\UserRegisterController;
use App\Http\Controllers\HomeController;
use App\Http\Controllers\RoleController;
use App\Http\Controllers\UserController;
use App\Http\Controllers\ProductController;
use App\Http\Controllers\SendSmsController;
use App\Http\Controllers\AIChatController;
use App\Http\Controllers\TestController;
use App\Http\Controllers\MqttDataController;
use App\Http\Controllers\MqttController;



Route::get('/trigger-event', [TestController::class, 'triggerEvent']);

Route::get('/', function () {
    return view('welcome');
    // return phpinfo();
});
Route::get('/gemini-chat', [AIChatController::class, 'index'])->name('gemini.chat');
Route::post('/gemini-chat/send', [AIChatController::class, 'sendMessage'])->name('gemini.chat.send');
//Auth::routes();

Route::get('/home', [HomeController::class, 'index'])->name('home');
Route::post('/send-sms', [SendSmsController::class, 'sendSMS']);

Route::get('userfetch', [UserLoginController::class, 'FetchUser']);
//Route::middleware('auth:api')->get('/user-permissions', [UserController::class, 'getPermissions']);
//Route::middleware('auth:sanctum')->get('/user-permissions', [UserController::class, 'getPermissions']);
Route::middleware('auth')->get('/user-permissions', [UserController::class, 'getPermissions']);
//Route::get('/user-permissions', [UserController::class, 'getPermissions']);

Route::post('/login', [AuthController::class, 'login']);
Route::post('/logout', [AuthController::class, 'logout'])->middleware('auth:sanctum');
Route::get('/user', [AuthController::class, 'user'])->middleware('auth:sanctum');


//Route::get('/roles', [RoleController::class, 'index']);

Route::group(['middleware' => ['auth']], function () {
    //Route::middleware('auth:api')->group(function () {
    Route::resource('roles', RoleController::class);
    Route::resource('users', UserController::class);
    Route::resource('products', ProductController::class);

    Route::prefix('/auth')->group(function () {
        Route::post('/logout', [CustomAuthController::class, 'logout'])->name('logout1');
        Route::get('/user', function (Request $request) {
            return $request->user();
        });
    });
});



Route::post('/mqtt-data', [MqttDataController::class, 'store']);
Route::get('/mqtt', [MqttController::class, 'index']);
Route::get('/control-led', [MqttController::class, 'showControlLed']);
Route::post('/control-led', [MqttController::class, 'controlLed']);
Route::get('/sensor-data', [MqttController::class, 'getSensorData'])->name('sensor-data');

Route::get('/mqtt1', [MqttController::class, 'indexListner'])->name('mqtt1');

//Route::post('/sensor-data-test', [MqttController::class, 'saveSensorData']);

Route::get('/sensor-datalive', [MqttController::class, 'showSensorData']);

require __DIR__ . '/settings.php';
require __DIR__ . '/auth.php';
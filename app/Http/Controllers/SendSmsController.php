<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Http;

class SendSmsController extends Controller
{
//    public function sendSMS()
//    {
//        $payload = [
//            "UserName"        => "api-orbitbd@race.net.bd",
//            "Apikey"          => "U96YG4DDUDTCH44",
//            "MobileNumber"    => "8801844543266",
//            "SenderName"      => "8809643901301",
//            "TransactionType" => "T",
//            "Message"         => "Test SMS",
//        ];
//
//        $response = Http::withHeaders([
//            'Content-Type' => 'application/json', // ← Critical
//            'Accept'       => 'application/json',
//        ])
//            ->withBasicAuth('api-orbitbd@race.net.bd', 'U96YG4DDUDTCH44')
//            ->post('https://api.mimsms.com/api/SmsSending/SMS', $payload);
//
//        return $response->json();
//    }


}

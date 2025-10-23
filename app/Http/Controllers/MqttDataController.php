<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\MqttData;
use App\Models\SensorData;

class MqttDataController extends Controller
{
//    public function store(Request $request)
//    {
//
////        return 'hh';
//        $data = $request->validate([
//            'temperature' => 'required|numeric',
//            'humidity' => 'required|integer',
//            'speed' => 'required|integer',
//            'status' => 'required|string',
//            'uptime' => 'required|integer',
//        ]);
//
////        MqttData::create($data);
//        SensorData::create($data);
////        SensorData
//
//        return response()->json(['message' => 'Data stored successfully']);
//    }


    public function store(Request $request)
    {
        try {
            $data = $request->validate([
                'temperature' => 'required|numeric',
                'humidity' => 'required|integer',
                'speed' => 'required|integer',
                'status' => 'required|string',
                'uptime' => 'required|integer',
            ]);

            SensorData::create($data);

            return response()->json(['message' => 'Data stored successfully']);
        } catch (\Exception $e) {
            return response()->json(['message' => 'Failed to store data', 'error' => $e->getMessage()], 500);
        }
    }
}

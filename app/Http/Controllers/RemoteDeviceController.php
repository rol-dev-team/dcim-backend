<?php

namespace App\Http\Controllers;

use Bluerhinos\phpMQTT;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class RemoteDeviceController extends Controller
{
    public function showControlLed()
    {
        return view('control-led');
    }

    public function controlLed(Request $request)
    {
        $server = env('MQTT_HOST', '182.48.80.230');
        $port = env('MQTT_PORT', 1883);
        $username = env('MQTT_USERNAME', 'test');
        $password = env('MQTT_PASSWORD', 'test');
        $client_id = 'laravel_mqtt_listener_' . uniqid();


        $topic = $request->input('topic');

        if (empty($topic)) {
            $topic = DB::table('device_lists as dl')
                ->where('dl.id', $request->input('device_id'))
                ->value('dl.secret_key');
        }

        $mqtt = new phpMQTT($server, $port, $client_id);
        if ($mqtt->connect(true, NULL, $username, $password)) {
            $message = $request->input('ledState');


            $mqtt->publish($topic, $message, 0);

            $mqtt->close();
            return response()->json([
                'status' => 'success',
                'message' => 'LED state updated',
                'topic' => $topic
            ]);
        } else {
            return response()->json(['status' => 'error', 'message' => 'Could not connect to MQTT broker']);
        }
    }

    public function controlSensor(Request $request)
    {
        $server = env('MQTT_HOST', '182.48.80.230');
        $port = env('MQTT_PORT', 1883);
        $username = env('MQTT_USERNAME', 'test');
        $password = env('MQTT_PASSWORD', 'test');
        $client_id = 'laravel_mqtt_sensor_' . uniqid();

        

    
            $topic = DB::select("SELECT dl.control_topic
                        FROM dcim_web_db.device_lists dl
                        INNER JOIN dcim_web_db.sensor_lists sl ON dl.id = sl.device_id
                        where sl.id = '$request->sensor_id' ");

                        // return $topic;

        $finalTopic = $topic[0]->control_topic ?? null;
        // $finalTopic = "dc_1/device_1/led_1";
        // return json_encode($request->all()); 
        if (empty($finalTopic)) {
            return response()->json([
                'status' => 'error',
                'message' => 'Sensor/device not found'
            ], 404);
        }

        $mqtt = new phpMQTT($server, $port, $client_id);
        
        if ($mqtt->connect(true, NULL, $username, $password)) {
            $message = json_encode($request->all()); 
            // $message = $request->all(); 
            // $message['deviceId'] = 1;
            // $message = 1;

            $mqtt->publish($finalTopic, $message, 0);
            $mqtt->close();

            return response()->json([
                'status' => 'success',
                'message' => 'Sensor value updated',
                'topic' => $finalTopic,
                'value' => $message
            ]);
        } else {
            return response()->json([
                'status' => 'error',
                'message' => 'Could not connect to MQTT broker'
            ], 500);
        }
    }


    // public function controlLed(Request $request)
    // {
    //     $server = env('MQTT_HOST', '182.48.80.230');
    //     $port = env('MQTT_PORT', 1883);
    //     $username = env('MQTT_USERNAME', 'test');
    //     $password = env('MQTT_PASSWORD', 'test');
    //     $client_id = 'laravel_mqtt_listener_' . uniqid();

    //     // Get dynamic topic from request or database
    //     $topic = $request->input('topic'); // Or fetch from DB like in your example
        
    //     // If topic is not provided in request, you could fetch it from database
    //     if (empty($topic)) {
    //         $topic = DB::table('device_lists as dl')
    //             ->where('dl.id', $request->input('device_id')) // assuming you pass device_id
    //             ->value('dl.secret_key');
    //     }

    //     $mqtt = new phpMQTT($server, $port, $client_id);
    //     if ($mqtt->connect(true, NULL, $username, $password)) {
    //         $message = $request->input('ledState'); // 1 for ON, 0 for OFF
            
    //         // Publish to dynamic topic
    //         $mqtt->publish($topic, $message, 0);
            
    //         $mqtt->close();
    //         return response()->json([
    //             'status' => 'success', 
    //             'message' => 'LED state updated',
    //             'topic' => $topic // Optional: return the topic used
    //         ]);
    //     } else {
    //         return response()->json(['status' => 'error', 'message' => 'Could not connect to MQTT broker']);
    //     }
    // }
}

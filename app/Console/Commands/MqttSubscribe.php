<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use Bluerhinos\phpMQTT;

class MqttSubscribe extends Command
{
    protected $signature = 'mqtt:subscribe';
    protected $description = 'Subscribe to MQTT and process messages';

    public function handle()
    {
        // Configure MQTT connection parameters
        $server = '182.48.80.230';
        $port = 1883;
        $username = 'test';
        $password = 'test';
        $client_id = 'laravelClient';

        $mqtt = new phpMQTT($server, $port, $client_id);
        if ($mqtt->connect(true, NULL, $username, $password)) {
            $mqtt->subscribe(['dc_1/device_1/json' => ['qos' => 0, 'function' => [$this, 'messageReceived']]]);
            while ($mqtt->proc()) {
                // Keep processing messages
            }
        }
    }

    public function messageReceived($topic, $msg)
    {
        $data = json_decode($msg, true);
        \DB::table('sensor_data')->insert([
            'temperature' => $data['temperature'],
            'humidity' => $data['humidity'],
            'speed' => $data['speed'],
            'status' => $data['status'],
            'uptime' => $data['uptime'],
            'created_at' => now(),
            'updated_at' => now(),
        ]);
        \Log::info("Received message on topic {$topic}: " . print_r($data, true));
    }
}


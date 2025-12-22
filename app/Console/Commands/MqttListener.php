<?php

namespace App\Console\Commands;

use App\Events\MQTTPublishEvent;
use App\Models\SensorRealTimeValue;
use App\Models\SensorLogValue;
use Illuminate\Console\Command;
use Bluerhinos\phpMQTT;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;

class MqttListener extends Command
{
    protected $signature = 'mqtt:listen';
    protected $description = 'Listen to MQTT topics';


    public function handle()
    {
        $server = env('MQTT_HOST', '182.48.80.230');
        $port = env('MQTT_PORT', 1883);
        $username = env('MQTT_USERNAME', 'test');
        $password = env('MQTT_PASSWORD', 'test');
        $client_id = 'laravel_mqtt_listener_' . uniqid();

        $mqtt = new phpMQTT($server, $port, $client_id);

        if ($mqtt->connect(true, null, $username, $password)) {
            $this->info("Connected to MQTT broker");

            $topicList = DB::table('device_lists as dl')
                ->select(DB::raw("dl.secret_key as topic"))
                ->pluck('topic')
                ->toArray();

            $this->info("Subscribing to topics: " . implode(', ', $topicList));

            $topics = [];

            foreach ($topicList as $topic) {
                $topics[$topic] = [
                    'qos' => 0,
                    'function' => function ($topic, $msg) {
                        $data = json_decode($msg, true);

                        event(new MQTTPublishEvent($data));

                        Log::info("MQTT Message Received on topic [$topic]:", $data);

                        echo "Received from $topic: " . print_r($data, true) . "\n";

                        if (isset($data['sensor_types'])) {
                            foreach ($data['sensor_types'] as $sensorType) {
                                foreach ($sensorType as $key => $sensorArray) {
                                    if (is_array($sensorArray)) {
                                        foreach ($sensorArray as $sensor) {
                                            if (isset($sensor['id']) && isset($sensor['val'])) {
                                                try {
                                                    DB::beginTransaction();

                                                    $existingSensor = SensorRealTimeValue::where('sensor_id', $sensor['id'])->first();

                                                    if ($existingSensor) {
                                                        
                                                        SensorLogValue::create([
                                                            'sensor_id' => $existingSensor->sensor_id,
                                                            'value' => $existingSensor->value,
                                                            'created_at' => now(),
                                                            'updated_at' => now()
                                                        ]);

                                                        $existingSensor->delete();

                                                        echo "Logged and deleted previous data for Sensor ID: {$sensor['id']}\n";
                                                    }

                                                    SensorRealTimeValue::create([
                                                        'sensor_id' => $sensor['id'],
                                                        'value' => $sensor['val'],
                                                        'received_at' => now(),
                                                        'topic' => $topic
                                                    ]);

                                                    echo "Inserted Sensor ID: {$sensor['id']} with Value: {$sensor['val']} from topic: $topic\n";

                                                    DB::commit();

                                                } catch (\Exception $e) {
                                                    
                                                    DB::rollBack();
                                                    Log::error("Failed to process sensor data: " . $e->getMessage());
                                                    echo "Error processing sensor data: " . $e->getMessage() . "\n";
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                ];
            }

            // Subscribe to all topics
            $mqtt->subscribe($topics, 0);

            // Keep listening
            while ($mqtt->proc()) {
                // Process incoming messages
            }

            $mqtt->close();
        } else {
            $this->error("Could not connect to MQTT broker");
        }
    }


    // public function handle()
    // {
    //     $server = env('MQTT_HOST', '182.48.80.230');
    //     $port = env('MQTT_PORT', 1883);
    //     $username = env('MQTT_USERNAME', 'test');
    //     $password = env('MQTT_PASSWORD', 'test');
    //     $client_id = 'laravel_mqtt_listener_' . uniqid();

    //     $this->info("Attempting to connect to MQTT: $server:$port");

    //     $mqtt = new phpMQTT($server, $port, $client_id);

    //     if ($mqtt->connect(true, null, $username, $password)) {
    //         $this->info("✓ Connected to MQTT broker");

    //         $topicList = DB::table('device_lists as dl')
    //             ->select(DB::raw("dl.secret_key as topic"))
    //             ->pluck('topic')
    //             ->toArray();

    //         if (empty($topicList)) {
    //             $this->error("✗ No topics found in database!");
    //             return;
    //         }

    //         $this->info("✓ Found " . count($topicList) . " topics");
    //         $this->info("Subscribing to topics: " . implode(', ', $topicList));

    //         $topics = [];

    //         foreach ($topicList as $topic) {
    //             $topics[$topic] = [
    //                 'qos' => 0,
    //                 'function' => function ($topic, $msg) {
    //                     $this->info("✓ Message received on topic: $topic");
                        
    //                     $data = json_decode($msg, true);

    //                     if ($data === null) {
    //                         $this->error("✗ Failed to decode JSON: $msg");
    //                         return;
    //                     }

    //                     $this->info("✓ Decoded message: " . json_encode($data));
                        
    //                     event(new MQTTPublishEvent($data));
    //                     Log::info("MQTT Message Received on topic [$topic]:", $data);

    //                     if (isset($data['sensor_types']) && is_array($data['sensor_types'])) {
    //                         $this->info("Processing sensor_types...");
                            
    //                         foreach ($data['sensor_types'] as $sensorType) {
    //                             if (!is_array($sensorType)) continue;
                                
    //                             foreach ($sensorType as $key => $sensorArray) {
    //                                 if (!is_array($sensorArray)) continue;
                                    
    //                                 foreach ($sensorArray as $sensor) {
    //                                     if (isset($sensor['id']) && isset($sensor['val'])) {
    //                                         try {
    //                                             DB::beginTransaction();

    //                                             $existingSensor = SensorRealTimeValue::where('sensor_id', $sensor['id'])->first();

    //                                             if ($existingSensor) {
    //                                                 SensorLogValue::create([
    //                                                     'sensor_id' => $existingSensor->sensor_id,
    //                                                     'value' => $existingSensor->value,
    //                                                     'created_at' => now(),
    //                                                     'updated_at' => now()
    //                                                 ]);

    //                                                 $existingSensor->delete();
    //                                                 $this->info("✓ Logged and deleted previous data for Sensor ID: {$sensor['id']}");
    //                                             }

    //                                             SensorRealTimeValue::create([
    //                                                 'sensor_id' => $sensor['id'],
    //                                                 'value' => $sensor['val'],
    //                                                 'received_at' => now(),
    //                                                 'topic' => $topic
    //                                             ]);

    //                                             $this->info("✓ Inserted Sensor ID: {$sensor['id']} with Value: {$sensor['val']}");
    //                                             DB::commit();

    //                                         } catch (\Exception $e) {
    //                                             DB::rollBack();
    //                                             $this->error("✗ Failed to process sensor data: " . $e->getMessage());
    //                                             Log::error("Failed to process sensor data: " . $e->getMessage());
    //                                         }
    //                                     }
    //                                 }
    //                             }
    //                         }
    //                     } else {
    //                         $this->warn("⚠ No sensor_types found in message");
    //                     }
    //                 }
    //             ];
    //         }

    //         // Subscribe to all topics
    //         $subscribed = $mqtt->subscribe($topics, 0);
            
    //         if ($subscribed) {
    //             $this->info("✓ Successfully subscribed to topics");
    //         } else {
    //             $this->error("✗ Failed to subscribe to topics");
    //             return;
    //         }

    //         $this->info("Listening for messages... (Press Ctrl+C to stop)");

    //         // Keep listening with timeout
    //         $timeout = 0;
    //         while ($mqtt->proc()) {
    //             $timeout++;
    //             if ($timeout % 100 == 0) {
    //                 $this->line(".");  // Show heartbeat
    //             }
    //         }

    //         $mqtt->close();
    //     } else {
    //         $this->error("✗ Could not connect to MQTT broker");
    //         $this->error("Connection details: $server:$port (User: $username)");
    //     }
    // }
}

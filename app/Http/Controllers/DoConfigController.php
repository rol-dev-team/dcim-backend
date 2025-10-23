<?php

namespace App\Http\Controllers;
use App\Models\SensorList;
use App\Models\{
    DoOperationTrigger,
    DoOperationMode,
    Schedulling,
    RepeatType,
    PairGroup,
    PairList
};

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Bluerhinos\phpMQTT;

class DoConfigController extends Controller
{
    // public function doSensorLists(Request $request)
    // {
    //     $sensors = SensorList::where('sensor_type_list_id', 6)
    //                 ->where('data_center_id', $request->dataCenterId)
    //                 ->get();

    //     return response()->json($sensors);
    // }


    public function doSensorLists(Request $request)
    {


        $usedSensorIds = DoOperationTrigger::pluck('sensor_id')->toArray();

        $sensors = SensorList::where('sensor_type_list_id', 6)
                    ->where('data_center_id', $request->dataCenterId)
                    ->whereNotIn('id', $usedSensorIds)
                    ->get();

        return response()->json($sensors);
    }


    // public function doSensorLists(Request $request)
    // {
    //     $usedSensorIds = array_map(function ($item) {
    //         return $item->sensor_id;
    //     }, DB::connection('mysql')->select("SELECT sensor_id FROM do_operation_triggers"));

    //     $sensors = SensorList::where('sensor_type_list_id', 6)
    //                 ->where('data_center_id', $request->dataCenterId)
    //                 ->whereNotIn('id', $usedSensorIds)
    //                 ->get();

    //     return response()->json($sensors);
    // }




    public function operationMode()
    {
        $modes = DoOperationMode::all();
        return response()->json($modes);
    }

    public function schedullingList()
    {
        $schedullings = Schedulling::all();
        return response()->json($schedullings);
    }


    public function repeatList()
    {
        $repeat = RepeatType::all();
        return response()->json($repeat);
    }



    public function storeOperationTriggerOld(Request $request)
    {


        $sensorIds = $request->input('sensors');

        // return response()->json($sensorIds);

        $isMultipleSensors = (count($sensorIds) > 1);

        if ($isMultipleSensors) {
            $request->validate([
                'startWith' => 'required|integer',
            ]);
        }

        DB::beginTransaction();

        try {
            $triggers = [];
            $pairGroup = null;

            // $dayIdForStorage = $request->has('days') ? json_encode($request->input('days')) : null;

            // return response()->json($dayIdForStorage);

            $days = $request->input('days');


            // $dayIdForStorage = !empty($days)? json_encode($days) : "";
            $dayIdForStorage = is_array($days) ? json_encode($days) : json_encode([]);

            // return response()->json($dayIdForStorage);

            $sensorCount = 0;

            foreach ($sensorIds as $sensorId) {
                $currentDuration = $request->runningDuration;
                $currentOffDuration = $request->restDuration;

                if ($isMultipleSensors && $sensorCount === 1) {
                    $currentDuration = $request->restDuration;
                    $currentOffDuration = $request->runningDuration;
                }

                $trigger = DoOperationTrigger::create([
                    'sensor_id'    => $sensorId,
                    'mode_id'      => $request->mode,
                    'repeat_id'    => $request->repeat_id,
                    'day_id'       => json_encode($days),
                    'on_time'      => $request->startTime,
                    'off_time'     => $request->endTime,
                    'duration'     => $currentDuration,
                    'off_duration' => $currentOffDuration,
                    'date'         => $request->date,
                    'status'       => 1,
                ]);
                $triggers[] = $trigger;
                $sensorCount++;
            }

            if ($isMultipleSensors) {
                $pairGroup = PairGroup::create([
                    'group'      => json_encode($sensorIds),
                    'start_with' => $request->startWith,
                    'status'     => 1,
                ]);

                foreach ($sensorIds as $sensorId) {
                    PairList::create([
                        'sensor_id'     => $sensorId,
                        'pair_group_id' => $pairGroup->id,
                        'status'        => 1,
                    ]);
                }
            }
            DB::commit();
            return response()->json([
                'success' => true,
                'message' => $isMultipleSensors ?
                             'Operation triggers and pair group inserted successfully.' :
                             'Operation trigger inserted successfully.',
                'data' => [
                    'triggers'   => $triggers,
                    'pair_group' => $pairGroup,
                ]
            ]);

        } catch (\Exception $e) {
            DB::rollBack();

            return response()->json([
                'success' => false,
                'message' => 'Failed to insert operation trigger(s).',
                'error'   => $e->getMessage(),
                // 'trace'   => $e->getTraceAsString(), // Uncomment for detailed debugging in development
            ], 500);
        }
    }


    // public function storeOperationTrigger(Request $request)
    // {
    //     date_default_timezone_set('Asia/Dhaka');



    //     $sensorIds = $request->input('sensors');
    //     $isMultipleSensors = (count($sensorIds) > 1);

    //     if ($isMultipleSensors) {
    //         $request->validate(['startWith' => 'required|integer']);
    //     }

    //             $createData = [
    //                         'relay_id'=>$sensorIds[0],
    //                         'mode'=>$request->mode == 1? 'manual':'toggle',
    //                         'state'=>'OFF',
    //                         'status'=>'active',
    //                         ];
    //     return json_encode($createData) ;

    //     DB::beginTransaction();

    //     try {
    //         $triggers = [];
    //         $pairGroup = null;
    //         $dayIdForStorage = is_array($request->days) ? json_encode($request->days) : json_encode([]);
    //         $sensorCount = 0;

    //         foreach ($sensorIds as $sensorId) {
    //             // Determine durations based on sensor position in pair
    //             $currentDuration = ($isMultipleSensors && $sensorCount === 1)
    //                 ? $request->restDuration
    //                 : $request->runningDuration;

    //             $currentOffDuration = ($isMultipleSensors && $sensorCount === 1)
    //                 ? $request->runningDuration
    //                 : $request->restDuration;

    //             // Create the operation trigger
    //             $trigger = DoOperationTrigger::create([
    //                 'rule'         => $request->rule,
    //                 'sensor_id'    => $sensorId,
    //                 'mode_id'      => $request->mode,
    //                 'repeat_id'    => $request->repeat_id,
    //                 'day_id'       => $dayIdForStorage,
    //                 'on_time'      => $request->startTime,
    //                 'off_time'     => $request->endTime,
    //                 'duration'     => $currentDuration,
    //                 'off_duration' => $currentOffDuration,
    //                 'dateFrom'     => $request->fromDate,
    //                 'dateTo'       => $request->toDate,
    //                 'status'       => 1,
    //             ]);



    //             $triggers[] = $trigger;
    //             $sensorCount++;

    //             // Prepare MQTT message with both original and Unix format times
    //             $messageData = [
    //                 'command' => 'SET_SCHEDULE',
    //                 'rule' => $request->rule,
    //                 'sensor_id' => $sensorId,
    //                 'mode_id' => $request->mode,
    //                 'on_time' => $request->startTime,  // Original format (13:36)
    //                 'off_time' => $request->endTime,    // Original format (01:36)
    //                 'on_time_unix' => strtotime($request->startTime),  // Unix timestamp
    //                 'off_time_unix' => strtotime($request->endTime),   // Unix timestamp
    //                 'duration' => $currentDuration,
    //                 'off_duration' => $currentOffDuration,
    //                 'duration_seconds' => $this->convertDurationToSeconds($currentDuration),
    //                 'off_duration_seconds' => $this->convertDurationToSeconds($currentOffDuration),
    //                 'days' => $request->days ?? [],
    //                 'dateFrom' => $request->fromDate,
    //                 'dateTo' => $request->toDate,
    //                 'status' => 1,
    //                 'timestamp' => now()->toDateTimeString()
    //             ];

    //             // Send to MQTT
    //             $this->publishToMqtt($sensorId, $messageData);
    //         }

    //         // Handle pairing if multiple sensors
    //         if ($isMultipleSensors) {
    //             $pairGroup = PairGroup::create([
    //                 'group'      => json_encode($sensorIds),
    //                 'start_with' => $request->startWith,
    //                 'status'     => 1,
    //             ]);

    //             foreach ($sensorIds as $sensorId) {
    //                 PairList::create([
    //                     'sensor_id'     => $sensorId,
    //                     'pair_group_id' => $pairGroup->id,
    //                     'status'        => 1,
    //                 ]);
    //             }
    //         }

    //         DB::commit();

    //         return response()->json([
    //             'success' => true,
    //             'message' => $isMultipleSensors
    //                 ? 'Operation triggers and pair group created successfully'
    //                 : 'Operation trigger created successfully',
    //             'data' => [
    //                 'triggers' => $triggers,
    //                 'pair_group' => $pairGroup,
    //             ]
    //         ]);

    //     } catch (\Exception $e) {
    //         DB::rollBack();
    //         \Log::error("Operation trigger creation failed: " . $e->getMessage());

    //         return response()->json([
    //             'success' => false,
    //             'message' => 'Failed to create operation trigger(s)',
    //             'error' => $e->getMessage(),
    //         ], 500);
    //     }
    // }


    public function storeOperationTrigger(Request $request)
{
    date_default_timezone_set('Asia/Dhaka');

    $sensorIds = $request->input('sensors');
    $isMultipleSensors = (count($sensorIds) > 1);

    if ($isMultipleSensors) {
        $request->validate(['startWith' => 'required|integer']);
    }

    // Human-readable maps
    $modeMap = [
        1 => 'Manual',
        2 => 'Toggle',
        3 => 'Time'
    ];

    $repeatMap = [
        1 => 'Once',
        2 => 'Daily',
        3 => 'Weekly'
    ];

    $statusMap = [
        1 => 'Active',
        0 => 'Inactive'
    ];

    $startRelayId = $isMultipleSensors ? intval($request->startWith) : $sensorIds[0];
    $arr = array_values(array_diff($sensorIds, [$startRelayId]));

    // Prepare raw data
    $rawData = [
        'relay_id' => $startRelayId,
        'mode' => isset($modeMap[$request->mode]) ? strtolower($modeMap[$request->mode]) : null,
        'status' => strtolower($statusMap[1]),
        'rule' => isset($repeatMap[$request->scheduleFrequency]) ? strtolower($repeatMap[$request->scheduleFrequency]) : null,
        'repeat' => isset($repeatMap[$request->repeat_id]) ? $repeatMap[$request->repeat_id] : null,
        'on_time' => $request->startTime ?? null,
        'off_time' => $request->endTime ?? null,
        'on_duration' => $request->runningDuration !== null ? intval($request->runningDuration) : null,
        'off_duration' => $request->restDuration !== null ? intval($request->restDuration) : null,
        'days' => $request->days ?? null,
        'start_date' => $request->fromDate ?? null,
        'end_date' => $request->toDate ?? null,
    ];

    // Conditionally include paired_relay_id if multiple sensors
    if ($isMultipleSensors && count($arr) > 0) {
        $rawData['paired_relay_id'] = $arr[0];
    }

    // Conditionally include 'state' only if mode is Manual
    if ((int)$request->mode === 1) {
        $rawData['state'] = 'OFF';
    }

    // If mode is manual and only 1 sensor, remove duration fields
    if ((int)$request->mode === 1 && !$isMultipleSensors) {
        unset($rawData['on_duration'], $rawData['off_duration']);
    }

    // Filter out nulls, empty strings, and empty arrays
    $createData = array_filter($rawData, function ($value) {
        return !is_null($value) &&
            $value !== '' &&
            !(is_array($value) && empty($value));
    });

    // You can test this with:
    // return response()->json($createData);

    DB::beginTransaction();

    try {
        $triggers = [];
        $pairGroup = null;
        $dayIdForStorage = is_array($request->days) ? json_encode($request->days) : json_encode([]);
        $sensorCount = 0;

        foreach ($sensorIds as $sensorId) {
            $currentDuration = ($isMultipleSensors && $sensorCount === 1)
                ? $request->restDuration
                : $request->runningDuration;

            $currentOffDuration = ($isMultipleSensors && $sensorCount === 1)
                ? $request->runningDuration
                : $request->restDuration;

            $trigger = DoOperationTrigger::create([
                'rule' => $request->rule,
                'sensor_id' => $sensorId,
                'mode_id' => $request->mode,
                'repeat_id' => $request->repeat_id,
                'day_id' => $dayIdForStorage,
                'on_time' => $request->startTime,
                'off_time' => $request->endTime,
                'duration' => $currentDuration,
                'off_duration' => $currentOffDuration,
                'dateFrom' => $request->fromDate,
                'dateTo' => $request->toDate,
                'status' => 1,
            ]);

            $triggers[] = $trigger;
            $sensorCount++;

            $this->publishToMqtt($sensorId, $createData);
        }

        if ($isMultipleSensors) {
            $pairGroup = PairGroup::create([
                'group' => json_encode($sensorIds),
                'start_with' => $request->startWith,
                'status' => 1,
            ]);

            foreach ($sensorIds as $sensorId) {
                PairList::create([
                    'sensor_id' => $sensorId,
                    'pair_group_id' => $pairGroup->id,
                    'status' => 1,
                ]);
            }
        }

        DB::commit();

        return response()->json([
            'success' => true,
            'message' => $isMultipleSensors
                ? 'Operation triggers and pair group created successfully'
                : 'Operation trigger created successfully',
            'data' => [
                'triggers' => $triggers,
                'pair_group' => $pairGroup,
            ]
        ]);

    } catch (\Exception $e) {
        DB::rollBack();
        \Log::error("Operation trigger creation failed: " . $e->getMessage());

        return response()->json([
            'success' => false,
            'message' => 'Failed to create operation trigger(s)',
            'error' => $e->getMessage(),
        ], 500);
    }
}



/**
 * Convert duration to seconds
 */
    private function convertDurationToSeconds($duration)
    {
        if (is_numeric($duration)) {
            return (int)$duration;
        }

        if (strpos($duration, ':') !== false) {
            $parts = explode(':', $duration);
            $seconds = 0;

            if (count($parts) === 3) { // HH:MM:SS
                $seconds = $parts[0] * 3600 + $parts[1] * 60 + $parts[2];
            } elseif (count($parts) === 2) { // MM:SS
                $seconds = $parts[0] * 60 + $parts[1];
            }

            return $seconds;
        }

        return 0;
    }

/**
 * Publish message to MQTT broker
 */
    private function publishToMqtt($sensorId, $messageData)
    {
        $server = env('MQTT_HOST', '182.48.80.230');
        $port = env('MQTT_PORT', 1883);
        $username = env('MQTT_USERNAME', 'test');
        $password = env('MQTT_PASSWORD', 'test');
        $client_id = 'laravel_mqtt_sensor_' . uniqid();

        // Get the topic for the sensor
        $topic = DB::select("SELECT dl.control_topic
                    FROM dcim_web_db.device_lists dl
                    INNER JOIN dcim_web_db.sensor_lists sl ON dl.id = sl.device_id
                    WHERE sl.id = ?", [$sensorId]);

        $finalTopic = $topic[0]->control_topic ?? null;

        if (empty($finalTopic)) {
            \Log::error("MQTT Topic not found for sensor ID: $sensorId");
            return false;
        }

        // Add current Unix timestamp
        // $messageData['current_time_unix'] = time();

        // Convert durations from minutes to seconds
        // $messageData['duration_seconds'] = ($messageData['on_duration'] ?? 0) * 60;
        // $messageData['off_duration_seconds'] = ($messageData['off_duration'] ?? 0) * 60;

        $mqtt = new phpMQTT($server, $port, $client_id);

        if ($mqtt->connect(true, NULL, $username, $password)) {
            $message = json_encode($messageData);
            $mqtt->publish($finalTopic, $message, 0);
            $mqtt->close();
            return true;
        }

        \Log::error("Could not connect to MQTT broker for sensor ID: $sensorId");
        return false;
    }


}

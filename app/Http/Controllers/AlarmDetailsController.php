<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Traits\ApiResponseTrait;
use App\Models\AlarmAcknowledgement;
use App\Models\AlarmAcknowledgementLog;

class AlarmDetailsController extends Controller
{
    use ApiResponseTrait;

    public function acknowledgementStore(Request $request){

        $store = AlarmAcknowledgement::create([
                    'sensor_id'=> $request->sensorId,
                    'alarm_value'=> $request->alarmValue,
                    'checked_by'=> $request->userId,
                    'description'=> $request->message
                    ]);

                AlarmAcknowledgementLog::create([
                    'sensor_id' => $request->sensorId,
                    'alarm_value' => $request->alarmValue,
                    'checked_by' => $request->userId,
                    'description' => $request->message
                ]);

        return $this->successResponse($store, 'Acknowledged Successfully');
    }

    
}

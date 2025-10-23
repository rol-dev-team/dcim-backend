<?php

namespace App\Http\Controllers;

use App\Models\SensorTypeList;
use App\Models\TriggerType;
use Illuminate\Http\Request;

class SensorTypeListController extends Controller
{
    public function index()
    {
        $sensorsType = SensorTypeList::all();

//        return response()->json([
//            'status' => true,
//            'data' => $sensorsType
//        ]);
        return response()->json($sensorsType);
    }

    public function indexTrigger()
    {
        $triggerType = TriggerType::all();

        return response()->json($triggerType);
    }
}

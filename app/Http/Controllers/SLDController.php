<?php

namespace App\Http\Controllers;

use App\Models\Connection;
use App\Models\SldAsset;
use Illuminate\Http\Request;

class SLDController extends Controller
{
    public function getDiagram($datacenterId)
    {
        $assets = SldAsset::where('datacenter_id', $datacenterId)->with('conditions')->get();
        $connections = Connection::where('datacenter_id', $datacenterId)->get();

        // Simulated live values (in production, pull from DB or MQTT)
        $liveStatus = [
            'DG-01' => 1,
            'DG-02' => 0,
        ];

        $assets->transform(function ($asset) use ($liveStatus) {
            $status = $liveStatus[$asset->name] ?? null;

            $match = $asset->conditions->firstWhere('trigger_value', $status);
            $asset->color = $match->color ?? 'gray';
            return $asset;
        });

        return response()->json([
            'assets' => $assets,
            'connections' => $connections,
        ]);
    }

}

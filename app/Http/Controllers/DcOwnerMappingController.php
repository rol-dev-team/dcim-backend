<?php

namespace App\Http\Controllers;

use App\Models\DcOwnerMapping;
use App\Models\DcPartnerMapping;
use Illuminate\Http\Request;

class DcOwnerMappingController extends Controller
{
    public function store(Request $request)
    {
        $validated = $request->validate([
            'user_id' => 'required|integer|exists:users,id',
            'data_center_ids' => 'required|array',
            'data_center_ids.*' => 'integer|exists:data_center_creations,id',
        ]);

        // Delete existing mappings for this user
        DcOwnerMapping::where('user_id', $validated['user_id'])->delete();

        // Create new mappings
        $mappings = [];
        foreach ($validated['data_center_ids'] as $dataCenterId) {
            $mappings[] = [
                'user_id' => $validated['user_id'],
                'data_center_id' => $dataCenterId,
                'created_at' => now(),
                'updated_at' => now(),
            ];
        }

        DcOwnerMapping::insert($mappings);

        return response()->json([
            'message' => 'Data center mappings saved successfully',
            'mappings' => $mappings
        ], 201);
    }


    public function storeDcPartnerMapping(Request $request)
    {
        $validated = $request->validate([
            'partner_id' => 'required|integer|exists:users,id',
            'data_center_ids' => 'required|array',
            'data_center_ids.*' => 'integer|exists:data_center_creations,id',
        ]);

        // Delete existing mappings for this user
        DcPartnerMapping::where('partner_id', $validated['partner_id'])->delete();

        // Create new mappings
        $mappings = [];
        foreach ($validated['data_center_ids'] as $dataCenterId) {
            $mappings[] = [
                'partner_id' => $validated['partner_id'],
                'data_center_id' => $dataCenterId,
                'created_at' => now(),
                'updated_at' => now(),
            ];
        }

        DcPartnerMapping::insert($mappings);

        return response()->json([
            'message' => 'Data center mappings saved successfully',
            'mappings' => $mappings
        ], 201);
    }
}

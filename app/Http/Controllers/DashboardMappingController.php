<?php

namespace App\Http\Controllers;

use App\Models\DashboardTabList;
use App\Models\TabListMapping;
use Illuminate\Http\Request;

class DashboardMappingController extends Controller
{
    public function index()
    {
        $tabs = DashboardTabList::all();
        return response()->json($tabs);
    }

    public function getMappings(Request $request)
    {
        $request->validate([
            'data_center_id' => 'required|exists:data_center_creations,id'
        ]);

        $mappings = TabListMapping::where('data_center_id', $request->data_center_id)
            ->with('tab')
            ->get();

        return response()->json($mappings);
    }

    public function store(Request $request)
    {
        $validated = $request->validate([
            'data_center_id' => 'required|integer|exists:data_center_creations,id',
            'tab_ids' => 'required|array',
            'tab_ids.*' => 'integer|exists:dashboard_tab_lists,id'
        ]);

        // First, delete any existing mappings for this data center
        TabListMapping::where('data_center_id', $validated['data_center_id'])->delete();

        $mappings = [];
        foreach ($validated['tab_ids'] as $tabId) {
            $mappings[] = TabListMapping::create([
                'data_center_id' => $validated['data_center_id'],
                'tab_id' => $tabId
            ]);
        }

        return response()->json([
            'message' => 'Mappings created successfully',
            'data' => $mappings
        ], 201);
    }
}

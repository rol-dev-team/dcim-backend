<?php

namespace App\Http\Controllers;

use App\Models\ThresholdType;
use Illuminate\Http\Request;

class ThresholdTypeController extends Controller
{
    public function index()
    {
        return response()->json(ThresholdType::all());
    }

    // Create new threshold type
    public function store(Request $request)
    {
        $validated = $request->validate([
            'name' => 'required|string|max:255',
            'attach_sound' => 'nullable|string',
            'url' => 'nullable|url',
            'color' => 'nullable|string|max:50',
            'timestamp' => 'nullable|date'
        ]);

        $thresholdType = ThresholdType::create($validated);
        return response()->json($thresholdType, 201);
    }

    // Get single threshold type
    public function show(ThresholdType $thresholdType)
    {
        return response()->json($thresholdType);
    }

    // Update threshold type
    public function update(Request $request, ThresholdType $thresholdType)
    {
        $validated = $request->validate([
            'name' => 'sometimes|string|max:255',
            'attach_sound' => 'nullable|string',
            'url' => 'nullable|url',
            'color' => 'nullable|string|max:50',
            'timestamp' => 'nullable|date'
        ]);

        $thresholdType->update($validated);
        return response()->json($thresholdType);
    }

    // Delete threshold type
    public function destroy(ThresholdType $thresholdType)
    {
        $thresholdType->delete();
        return response()->json(null, 204);
    }
}

<?php

// app/Http/Controllers/DataCenterCreationController.php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\DataCenterCreation;

class DataCenterCreationController extends Controller
{
    public function store(Request $request)
    {
        $validated = $request->validate([
            'name' => 'required|string|max:255',
            'division' => 'required|string|max:255',
            'address' => 'required|string|max:255',
            'email_notification' => 'required|boolean',
            'sms_notification' => 'required|boolean',
            'owner_type_id' => 'required|boolean',
            'status' => 'required|boolean'
        ]);


        $dataCenter = DataCenterCreation::create($validated);

        return response()->json(['success' => true, 'data' => $dataCenter], 201);
    }
}


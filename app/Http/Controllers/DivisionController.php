<?php

namespace App\Http\Controllers;

use App\Models\Division;
use App\Traits\ApiResponseTrait;
use Illuminate\Http\Request;

class DivisionController extends Controller
{
    use ApiResponseTrait;
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $results = Division::all();
        return $this->successResponse($results,"Division Created");
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $result = Division::create([
            'name'=>$request->divisionName
        ]);
        return response()->json([
            'data'=>$result
        ]);
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        //
    }
}

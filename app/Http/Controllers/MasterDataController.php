<?php

namespace App\Http\Controllers;

use App\Models\DataCenterCreation;
use App\Models\Department;
use App\Models\Division;
use App\Models\OwnerType;
use App\Models\PartnerList;
use App\Models\UserType;
use Illuminate\Http\Request;
use Spatie\Permission\Models\Role;

class MasterDataController extends Controller
{
    public function FetchDivisions()
    {
        $division = Division::select('id', 'name')->get();
//        return $division;
        return response()->json($division);
//        return view('users.index2', compact('users'));
    }


    public function FetchUserType()
    {
//        $userType = UserType::all();
        $userType = UserType::select('id', 'name')->get();
        return response()->json($userType);
    }

    public function FetchUserRole()
    {
        $userRole = Role::select('id', 'name')->get();
        return response()->json($userRole);
    }

    public function FetchDepartments()
    {
        $department = Department::select('id', 'name')->get();
        return response()->json($department);
    }

    public function FetchOwnerTypes()
    {
        $ownerTypes = OwnerType::select('id', 'name')->get();
        return response()->json($ownerTypes);
    }


    public function getPartnerMapping()
    {
        $partnerMapping = PartnerList::select('id', 'name')
            ->orderByDesc('created_at')
            ->get();
        return response()->json($partnerMapping);
    }
    public function indexPartner()
    {
        return PartnerList::orderBy('name')->get();
    }

    /**
     * Store a newly created partner in storage.
     */
    public function storePartner(Request $request)
    {
        $validated = $request->validate([
            'name' => 'required|string|max:255|unique:partner_lists,name'
        ]);

        $partner = PartnerList::create($validated);

        return response()->json($partner, 201);
    }

    public function showPartner(PartnerList $partnerList)
    {
        return $partnerList;
    }

    /**
     * Update the specified partner in storage.
     */
    public function updatePartner(Request $request, PartnerList $partnerList)
    {
        $validated = $request->validate([
            'name' => 'required|string|max:255|unique:partner_lists,name,'.$partnerList->id
        ]);

        $partnerList->update($validated);

        return response()->json($partnerList);
    }

    /**
     * Remove the specified partner from storage.
     */
    public function destroyPartner(PartnerList $partnerList)
    {
        $partnerList->delete();

        return response()->json(null, 204);
    }
}

<?php

namespace App\Http\Controllers;

use App\Models\Location;
use App\Models\User;
use Illuminate\Http\Request;

class UserController extends Controller
{
    public function search_filter_sort($request)
    {
        $search = "";
        $filter = [];
        $location = new Location;
        if (isset($request->search) && !empty($request->search)) {
            $search = $request->search;
        }
        if (isset($request->location) && !empty($request->location)) {
            $filter['location_id'] = $location->get_location_id($request->location);
        }
        if (isset($request->status) && ($request->status == "activated" || $request->status == "deactivated")) {
            $filter['users.status'] = $request->status;
        }
        return [$search, $filter];
    }

    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
    {
        $sfs = $this->search_filter_sort($request);
        $user = new User;
        $location = new Location;
        return response()->json([
            'users' => $user->get_users($sfs[0], $sfs[1]),
            'users_count' => $user->get_users("", [], [], "no", "yes"),
            'users_enabled_count' => $user->get_users("", ['users.status' => 'activated'], [], "no", "yes"),
            'users_disabled_count' => $user->get_users("", ['users.status' => 'deactivated'], [], "no", "yes"),
            'locations' => $location->get_locations("", [], [], "no")
        ]);
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $data = [];
        $sfs = $this->search_filter_sort($request);
        $user = new User;
        $location = new Location;
        $id = $user->get_user_id($request->id);
        if (isset($request->activate)) {
            $user->update_user_status($id, "activated");
        }
        if (isset($request->deactivate)) {
            $user->update_user_status($id, "deactivated");
        }
        $data['users'] = $user->get_users($sfs[0], $sfs[1]);
        $data['users_count'] = $user->get_users("", [], [], "no", "yes");
        $data['users_enabled_count'] = $user->get_users("", ['users.status' => 'activated'], [], "no", "yes");
        $data['users_disabled_count'] = $user->get_users("", ['users.status' => 'deactivated'], [], "no", "yes");
        $data['locations'] = $location->get_locations("", [], [], "no");
        return response()->json($data);
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
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

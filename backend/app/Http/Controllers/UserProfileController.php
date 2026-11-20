<?php

namespace App\Http\Controllers;

use App\Models\Location;
use App\Models\User;
use Illuminate\Http\Request;

class UserProfileController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
    {
        $user = new User;
        $location = new Location;
        $usr = $user->get_user(session("uid"));
        return response()->json([
            'user' => $usr,
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
        $user = new User;
        $location = new Location;
        if (!isset($request->current_password)) {
            return response()->json([
                'errors' => [
                    'current_password' => ['Please enter password.']
                ]
            ], 422);
        }
        if (!password_verify($request->current_password, $user->get_user_password(session("uid"))['password'])) {
            return response()->json([
                'errors' => [
                    'current_password' => ['Incorrect password.']
                ]
            ], 422);
        }
        if (isset($request->update)) {
            $request->validate([
                'first_name' => 'required|max:255',
                'last_name' => 'required|max:255',
                'email' => 'required|email|unique:users,email,' . session("uid") . '|unique:administrators,email|max:255',
                'phone' => 'required|numeric|unique:users,phone,' . session("uid") . '|unique:administrators,phone|min_digits:11|max_digits:11',
                'address' => 'required',
                'location' => 'required'
            ]);
            $location_id = $location->get_location_id($request->location);
            if (empty($location->get_location($location_id))) {
                return response()->json([
                    'errors' => [
                        'location' => ['Invalid location.']
                    ]
                ], 422);
            }
            $user->update_user(session("uid"), [
                'fname' => $request->first_name,
                'lname' => $request->last_name,
                'email' => $request->email,
                'phone' => $request->phone,
                'address' => $request->address,
                'location_id' => $location_id,
            ]);
        }
        if (isset($request->change)) {
            $request->validate([
                'new_password' => 'required|different:current_password|min:6',
                'confirm_new_password' => 'required|same:new_password'
            ]);
            $user->update_user_password(session("uid"), $request->new_password);
        }
        $data['user'] = $user->get_user(session("uid"));
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

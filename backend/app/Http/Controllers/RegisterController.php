<?php

namespace App\Http\Controllers;

use App\Models\Location;
use App\Models\User;
use Illuminate\Http\Request;

class RegisterController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $location = new Location;
        return response()->json([
            'locations' => $location->get_locations("", ['status' => 'enabled'], [], "no")
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
        if (isset($request->register)) {
            $request->validate([
                'first_name' => 'required|max:255',
                'last_name' => 'required|max:255',
                'email' => 'required|email|unique:users,email|unique:administrators,email|max:255',
                'phone' => 'required|numeric|unique:users,phone|unique:administrators,phone|min_digits:11|max_digits:11',
                'address' => 'required',
                'location' => 'required',
                'password' => 'required|min:6'
            ]);
            $user->add_user([
                'fname' => $request->first_name,
                'lname' => $request->last_name,
                'email' => $request->email,
                'phone' => $request->phone,
                'address' => $request->address,
                'location_id' => $location->get_location_id($request->location),
                'password' => password_hash($request->password, PASSWORD_DEFAULT)
            ]);
        }
        $data['locations'] = $location->get_locations("", ['status' => 'enabled'], [], "no");
        $data['status'] = "success";
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

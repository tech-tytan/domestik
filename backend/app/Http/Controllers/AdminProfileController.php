<?php

namespace App\Http\Controllers;

use App\Models\Administrator;
use App\Models\Setting;
use Illuminate\Http\Request;

class AdminProfileController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $administrator = new Administrator;
        $setting = new Setting;
        return response()->json([
            'administrator' => $administrator->get_administrator(session("id")),
            'fee' => $setting->get_setting("monthly fee")['data']
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
        $administrator = new Administrator;
        $setting = new Setting;
        if (!isset($request->current_password)) {
            return response()->json([
                'errors' => [
                    'current_password' => ['Please enter password.']
                ]
            ], 422);
        }
        if (!password_verify($request->current_password, $administrator->get_administrator_password(session("id"))['password'])) {
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
                'email' => 'required|email|unique:administrators,email,' . session("id") . '|unique:users,email|max:255',
                'phone' => 'required|numeric|unique:administrators,phone,' . session("id") . '|unique:users,phone|min_digits:11|max_digits:11'
            ]);
            $administrator->update_administrator(session("id"), [
                'fname' => $request->first_name,
                'lname' => $request->last_name,
                'email' => $request->email,
                'phone' => $request->phone
            ]);
        }
        if (isset($request->set)) {
            $request->validate([
                'fee' => 'required|numeric'
            ]);
            $setting->update_setting("monthly fee", trim($request->fee, "-+"));
        }
        if (isset($request->change)) {
            $request->validate([
                'new_password' => 'required|different:current_password|min:6',
                'confirm_new_password' => 'required|same:new_password'
            ]);
            $administrator->update_administrator_password(session("id"), $request->new_password);
        }
        $data['administrator'] = $administrator->get_administrator(session("id"));
        $data['fee'] = $setting->get_setting("monthly fee")['data'];
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

<?php

namespace App\Http\Controllers;

use App\Models\Administrator;
use Illuminate\Http\Request;

class AdminSigninController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        //
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
        if (isset($request->signin)) {
            $request->validate([
                'email_or_phone' => 'required',
                'password' => 'required'
            ]);
            $admin = $administrator->get_administrator_email_phone($request->email_or_phone);
            if (!empty($admin)) {
                $id = $administrator->get_administrator_id($admin['index']);
                if (password_verify($request->password, $administrator->get_administrator_password($id)['password'])) {
                    $request->session()->invalidate();
                    $request->session()->regenerate();
                    $request->session()->put("id", $id);
                    $data['status'] = "success";
                } else {
                    return response()->json([
                        'error' => 'Invalid login credentials.'
                    ], 422);
                }
            } else {
                return response()->json([
                    'error' => 'Invalid login credentials.'
                ], 422);
            }
        }
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

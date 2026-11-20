<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;

class UserSigninController extends Controller
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
        $user = new User;
        if (isset($request->signin)) {
            $request->validate([
                'email_or_phone' => 'required',
                'password' => 'required'
            ]);
            $usr = $user->get_user_email_phone($request->email_or_phone);
            if (!empty($usr)) {
                $id = $user->get_user_id($usr['index']);
                if ($usr['state'] == "deactivated") {
                    return response()->json([
                        'error' => 'Account deactivated.'
                    ], 422);
                }
                if (password_verify($request->password, $user->get_user_password($id)['password'])) {
                    $request->session()->invalidate();
                    $request->session()->regenerate();
                    $request->session()->put("uid", $id);
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

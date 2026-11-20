<?php

namespace App\Http\Controllers;

use App\Mail\PasswordReset;
use App\Models\User;
use App\Models\VerificationCode;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Mail;

class UserForgotPasswordController extends Controller
{
    public function ext($seconds)
    {
        return date("Y-m-d H:i:s", $seconds);
    }

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
        $verification_code = new VerificationCode;
        $limit = 5;
        if (isset($request->forgot)) {
            $request->validate([
                'email' => 'required|email|max:255'
            ]);
            $code = mt_rand(100000, 999999);
            $expiration = $this->ext(time() + (300));
            $time = session("time");
            $ss = time() + (60);
            if (!$time) {
                $request->session()->invalidate();
                $request->session()->regenerate();
                $request->session()->put("time", $ss);
            }
            $resend_window = $time;
            $usr = $user->get_users("", ['email' => $request->email, 'users.status' => 'activated'], [], "no");
            if (!empty($usr)) {
                $vc = $verification_code->get_verification_code($request->email);
                if (empty($vc)) {
                    $verification_code->add_verification_code([
                        'email' => $request->email,
                        'code' => $code,
                        'expires_at' => $expiration
                    ]);
                } else {
                    if ($resend_window > time()) {
                        return response()->json([
                            'error' => 'Limit reached, try again in 60 seconds.'
                        ], 422);
                    }
                    $until = $vc['until'];
                    if ($until != null && strtotime($until) > time()) {
                        return response()->json([
                            'error' => 'Limit reached, try again in 24 hours.'
                        ], 422);
                    }
                    $count = $vc['count'];
                    if ($until == null && $count < $limit) {
                        $cnt = $count + 1;
                        $update = [
                            'code' => $code,
                            'expires_at' => $expiration,
                            'req_count' => $cnt
                        ];
                        $update = ($cnt == $limit) ? array_merge($update, [
                            'blocked_until' => $this->ext(time() + (86400))
                        ]) : $update;
                        $verification_code->update_verification_code($request->email, $update);
                    }
                    if ($until != null && strtotime($until) <= time() && $count <= $limit) {
                        $verification_code->update_verification_code($request->email, [
                            'code' => $code,
                            'expires_at' => $expiration,
                            'req_count' => 1,
                            'blocked_until' => null
                        ]);
                    }
                    $request->session()->invalidate();
                    $request->session()->regenerate();
                    $request->session()->put("time", $ss);
                }
                Mail::to($request->email)->send(new PasswordReset($usr[0]['first_name'], $code));
            }
            $data['email'] = $request->email;
            $data['forgot'] = "passed";
        }
        if (isset($request->verify)) {
            $request->validate([
                'code' => 'required|numeric|min_digits:6|max_digits:6'
            ]);
            $vc = $verification_code->get_verification_code($request->email);
            if (empty($vc)) {
                return response()->json([
                    'errors' => [
                        'code' => ['Invalid verification code.']
                    ]
                ], 422);
            }
            $until = $vc['until'];
            if (strtotime($vc['expiration_date']) <= time() || ($until != null && $vc['count'] == $limit)) {
                return response()->json([
                    'errors' => [
                        'code' => ['Expired verification code.']
                    ]
                ], 422);
            }
            if ($vc['verification_code'] != $request->code) {
                return response()->json([
                    'errors' => [
                        'code' => ['Incorrect verification code.']
                    ]
                ], 422);
            }
            $verification_code->update_verification_code($request->email, [
                'duration' => $this->ext(time() + (600))
            ]);
            $data['verify'] = "passed";
        }
        if (isset($request->change)) {
            $request->validate([
                'new_password' => 'required|min:6',
                'confirm_new_password' => 'required|same:new_password'
            ]);
            $vc = $verification_code->get_verification_code($request->email);
            if (empty($vc)) {
                return response()->json([
                    'error' => 'Invalid password reset request.'
                ], 422);
            }
            $until = $vc['until'];
            if (strtotime($vc['period']) <= time() || ($until != null && $vc['count'] == $limit)) {
                return response()->json([
                    'error' => 'Password reset request has expired.'
                ], 422);
            }
            $usr = $user->get_users("", ['email' => $request->email, 'users.status' => 'activated'], [], "no");
            $user->update_user_password($user->get_user_id($usr[0]['index']), $request->new_password);
            $verification_code->delete_verification_code($request->email);
            $data['change'] = "passed";
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

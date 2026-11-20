<?php

namespace App\Http\Middleware;

use App\Models\Administrator;
use App\Models\User;
use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class UserValidation
{
    /**
     * Handle an incoming request.
     *
     * @param  Closure(Request): (Response)  $next
     */
    public function handle(Request $request, Closure $next): Response
    {
        if (!session("id") && !session("uid")) {
            return response()->json([
                'status' => 'failed',
                'message' => 'Unauthenticated.'
            ], 401);
        }
        if (session("id")) {
            $administrator = new Administrator;
            if (empty($administrator->get_administrator(session("id")))) {
                $request->session()->invalidate();
                $request->session()->regenerateToken();
                return response()->json([
                    'status' => 'failed',
                    'message' => 'Invalid administrator.'
                ], 401);
            }
        }
        if (session("uid")) {
            $user = new User;
            $usr = $user->get_user(session("uid"));
            if (empty($usr)) {
                $request->session()->invalidate();
                $request->session()->regenerateToken();
                return response()->json([
                    'status' => 'failed',
                    'message' => 'Invalid user.'
                ], 401);
            }
            if ($usr['state'] == "deactivated") {
                $request->session()->invalidate();
                $request->session()->regenerateToken();
                return response()->json([
                    'status' => 'failed',
                    'message' => 'Account deactivated.'
                ], 403);
            }
        }
        return $next($request);
    }
}

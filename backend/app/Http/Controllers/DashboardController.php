<?php

namespace App\Http\Controllers;

use App\Models\Location;
use App\Models\Transaction;
use App\Models\User;
use Illuminate\Http\Request;

class DashboardController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $user = new User;
        $location = new Location;
        $transaction = new Transaction;
        return response()->json([
            'users' => $user->get_users("", [], [], "no", "yes"),
            'locations' => $location->get_locations("", [], [], "no", "yes"),
            'transactions' => $transaction->get_transactions("", [], [], "no", "yes"),
            'transactions_pending_count' => $transaction->get_transactions("", ['transactions.status' => 'pending'], [], "yes")
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
        //
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

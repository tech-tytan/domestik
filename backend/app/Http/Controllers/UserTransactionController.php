<?php

namespace App\Http\Controllers;

use App\Models\Transaction;
use Illuminate\Http\Request;

class UserTransactionController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $transaction = new Transaction;
        return response()->json([
            'transactions' => $transaction->get_transactions("", ['user_id' => session("uid")], [], "no"),
            'transactions_count' => $transaction->get_transactions("", ['user_id' => session("uid")], [], "yes"),
            'transactions_confirmed_count' => $transaction->get_transactions("", ['user_id' => session("uid"), 'transactions.status' => 'confirmed'], [], "yes"),
            'transactions_pending_count' => $transaction->get_transactions("", ['user_id' => session("uid"), 'transactions.status' => 'pending'], [], "yes"),
            'transactions_canceled_count' => $transaction->get_transactions("", ['user_id' => session("uid"), 'transactions.status' => 'canceled'], [], "yes"),
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

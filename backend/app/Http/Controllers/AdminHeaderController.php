<?php

namespace App\Http\Controllers;

use App\Models\Administrator;
use App\Models\Transaction;
use Illuminate\Http\Request;

class AdminHeaderController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $administrator = new Administrator;
        $transaction = new Transaction;
        $admin = $administrator->get_administrator(session("id"));
        return response()->json([
            'first_name' => $admin['first_name'],
            'transactions' => $transaction->get_transactions("", ['transactions.status' => 'pending'], [], "yes")
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

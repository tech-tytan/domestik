<?php

namespace App\Http\Controllers;

use App\Models\Transaction;
use Illuminate\Http\Request;

class TransactionController extends Controller
{
    public function search_filter_sort($request)
    {
        $search = "";
        $filter = [];
        if (isset($request->search) && !empty($request->search)) {
            $search = $request->search;
        }
        if (isset($request->status) && ($request->status == "pending" || $request->status == "canceled" || $request->status == "confirmed")) {
            array_push($filter, ...[['transactions.status', '=', $request->status]]);
        }
        if (isset($request->from)) {
            array_push($filter, ...[['transactions.created_at', '>=', $request->from]]);
        }
        if (isset($request->to)) {
            array_push($filter, ...[['transactions.created_at', '<=', $request->to]]);
        }
        return [$search, $filter];
    }

    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
    {
        $sfs = $this->search_filter_sort($request);
        $transaction = new Transaction;
        return response()->json([
            'transactions' => $transaction->get_transactions($sfs[0], $sfs[1], []),
            'transactions_count' => $transaction->get_transactions("", [], [], "yes"),
            'transactions_confirmed_count' => $transaction->get_transactions("", ['transactions.status' => 'confirmed'], [], "yes"),
            'transactions_pending_count' => $transaction->get_transactions("", ['transactions.status' => 'pending'], [], "yes"),
            'transactions_canceled_count' => $transaction->get_transactions("", ['transactions.status' => 'canceled'], [], "yes"),
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
        $sfs = $this->search_filter_sort($request);
        $transaction = new Transaction;
        $id = $transaction->get_transaction_id($request->id);
        if (isset($request->cancel)) {
            $transaction->update_transaction_status($id, "canceled");
        }
        if (isset($request->confirm)) {
            $transaction->update_transaction_status($id, "confirmed");
        }
        $data['transactions'] = $transaction->get_transactions($sfs[0], $sfs[1], []);
        $data['transactions_count'] = $transaction->get_transactions("", [], [], "yes");
        $data['transactions_confirmed_count'] = $transaction->get_transactions("", ['transactions.status' => 'confirmed'], [], "yes");
        $data['transactions_pending_count'] = $transaction->get_transactions("", ['transactions.status' => 'pending'], [], "yes");
        $data['transactions_canceled_count'] = $transaction->get_transactions("", ['transactions.status' => 'canceled'], [], "yes");
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

<?php

namespace App\Http\Controllers;

use App\Models\Setting;
use App\Models\Transaction;
use Illuminate\Http\Request;

class VerifyController extends Controller
{
    public function verify($reference)
    {
        $setting = new Setting;

        $curl = curl_init();

        curl_setopt_array($curl, array(
            CURLOPT_URL => "https://api.paystack.co/transaction/verify/{$reference}",
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_ENCODING => "",
            CURLOPT_MAXREDIRS => 10,
            CURLOPT_TIMEOUT => 30,
            CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
            CURLOPT_CUSTOMREQUEST => "GET",
            CURLOPT_HTTPHEADER => array(
                "Authorization: Bearer {$setting->get_setting("paystack secret key")['data']}",
                "Cache-Control: no-cache",
            ),
        ));

        $response = curl_exec($curl);
        $err = curl_error($curl);

        curl_close($curl);

        if ($err) {
            return false;
        } else {
            if ($response) {
                $response = json_decode($response, true);
                if ($response['status'] && isset($response['data']['status']) && $response['data']['status'] == "success") {
                    return $response;
                }
            }
            return false;
        }
    }

    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
    {
        $data = [];
        $transaction = new Transaction;
        if (isset($request->reference)) {
            $tranx = $transaction->get_transaction_by_reference($request->reference);
            if (!empty($tranx) && $request->reference == $tranx['ref']) {
                $verify = $this->verify($request->reference);
                if ($verify && $verify['data']['amount'] == ($tranx['amount_paid'] * 100) && $verify['data']['currency'] == "NGN") {
                    if ($transaction->update_transaction_status($transaction->get_transaction_id($tranx['index']), "confirmed")) {
                        $data['status'] = "success";
                    } else {
                        $data['status'] = "failed";
                    }
                }
            }
        }
        return response()->json($data);
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

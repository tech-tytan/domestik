<?php

namespace App\Http\Controllers;

use App\Models\Setting;
use App\Models\Transaction;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;

class OverviewController extends Controller
{
    public function initialize($email, $amount, $reference)
    {
        $setting = new Setting;

        $url = "https://api.paystack.co/transaction/initialize";

        $fields = [
            'email' => $email,
            'amount' => ($amount * 100),
            'reference' => $reference,
            'callback_url' => config('services.app.url') . '/verify',
        ];

        $fields_string = http_build_query($fields);

        //open connection
        $ch = curl_init();

        //set the url, number of POST vars, POST data
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_POST, true);
        curl_setopt($ch, CURLOPT_POSTFIELDS, $fields_string);
        curl_setopt($ch, CURLOPT_HTTPHEADER, array(
            "Authorization: Bearer {$setting->get_setting("paystack secret key")['data']}",
            "Cache-Control: no-cache",
        ));

        //So that curl_exec returns the contents of the cURL; rather than echoing it
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);

        //execute post
        $response = curl_exec($ch);
        $err = curl_error($ch);

        curl_close($ch);

        if ($err) {
            return false;
        } else {
            if ($response) {
                $response = json_decode($response, true);
                if ($response['status']) {
                    return $response['data']['authorization_url'];
                }
            }
            return false;
        }
    }

    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $data = [];
        $transaction = new Transaction;
        $setting = new Setting;
        $transactions = $transaction->get_transactions("", ['user_id' => session("uid")], [], "no", "yes");
        $data['fee'] = $setting->get_setting("monthly fee")['data'];
        $data['transactions'] = $transactions;
        $data['transactions_pending_count'] = $transaction->get_transactions("", ['user_id' => session("uid"), 'transactions.status' => 'pending'], [], "yes");
        for ($x = 0; $x <= (count($transactions) - 1); $x++) {
            if ($transactions[$x]['state'] == "confirmed") {
                $data['expiration_date'] = Carbon::parse($transactions[$x]['date_time'])->addMonthNoOverflow((int)$transactions[$x]['months'])->timestamp;
                break;
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
        $data = [];
        $transaction = new Transaction;
        $setting = new Setting;
        $user = new User;
        if (isset($request->pay)) {
            $months = trim($request->months, "-+");
            if (isset($months) && is_numeric($months) && $months > 0 && strlen($months) <= 255) {
                $amount = $months * $setting->get_setting("monthly fee")['data'];
                $trans = $transaction->add_transaction([
                    'amount' => $amount,
                    'no_of_months' => $months,
                    'user_id' => session("uid")
                ]);
                $reference = "T-" . str_shuffle(mt_rand(10000, 99999) . $trans);
                $transaction->update_transaction_reference($trans, $reference);
                $initialize = $this->initialize($user->get_user(session("uid"))['email_address'], $amount, $reference);
                if ($initialize) {
                    $data['payment_link'] = $initialize;
                }
            }
        }
        $transactions = $transaction->get_transactions("", ['user_id' => session("uid")], [], "no", "yes");
        $data['fee'] = $setting->get_setting("monthly fee")['data'];
        $data['transactions'] = $transactions;
        $data['transactions_pending_count'] = $transaction->get_transactions("", ['user_id' => session("uid"), 'transactions.status' => 'pending'], [], "yes");
        for ($x = 0; $x <= (count($transactions) - 1); $x++) {
            if ($transactions[$x]['state'] == "confirmed") {
                $data['expiration_date'] = Carbon::parse($transactions[$x]['date_time'])->addMonthNoOverflow((int)$transactions[$x]['months'])->timestamp;
                break;
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

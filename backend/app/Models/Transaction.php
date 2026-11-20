<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use App\Traits\HasUuid;

class Transaction extends Model
{
    use HasUuid;

    protected $fillable = ['uuid', 'reference', 'amount', 'no_of_months', 'status', 'user_id'];

    protected $selection = ['transactions.uuid as index', 'reference as ref', 'amount as amount_paid', 'no_of_months as months', 'transactions.status as state', 'transactions.created_at as date_time', 'fname as first_name', 'lname as last_name', 'email as email_address', 'phone as phone_number'];

    protected static function booted()
    {
        parent::booted();
    }

    public function get_transactions(string $search = "", array $filter = [], array $sort = [], string $count = "no", string $limit = "no"): array|string
    {
        $query = self::select($this->selection)->join("users", "user_id", "=", "users.id");
        if (!empty($search)) {
            $query = $query->where("reference", "like", "%$search%");
        }
        if (!empty($filter)) {
            $query = $query->where($filter);
        }
        if (!empty($sort)) {
            $query = $query->where($sort);
        }
        if ($count == "yes") {
            return $query->count();
        }
        $query = $query->orderBy("transactions.id", "desc");
        if ($limit == "yes") {
            return $query->limit(10)->get()->toArray();
        }
        return $query->paginate(10)->toArray();
    }

    public function get_transaction(int $id): array|string
    {
        $query = self::select($this->selection)->find($id)->join("users", "user_id", "=", "users.id");
        return ($query != null) ? $query->toArray() : [];
    }

    public function get_transaction_by_reference(string $reference): array|string
    {
        $query = self::select($this->selection)->join("users", "user_id", "=", "users.id")->where(['reference' => $reference])->first();
        return ($query != null) ? $query->toArray() : [];
    }

    public function get_transaction_id(string $uuid): array|string
    {
        $query = self::select("id")->where(['uuid' => $uuid])->first();
        return ($query != null) ? $query->toArray()['id'] : 0;
    }

    public function add_transaction(array $data): int|string
    {
        return self::create($data)->id;
    }

    public function update_transaction_status(int $id, string $status): int|string
    {
        return self::where(['id' => $id, 'status' => 'pending'])->update(['status' => $status]);
    }

    public function update_transaction_status_user(int $uid, int $id, string $status): int|string
    {
        return self::where(['id' => $id, 'status' => 'pending', 'user_id' => $uid])->update(['status' => $status]);
    }

    public function update_transaction_reference(int $id, string $reference): int|string
    {
        return self::where(['id' => $id])->update(['reference' => $reference]);
    }
}

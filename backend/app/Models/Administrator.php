<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Administrator extends Model
{
    protected $fillable = ['fname', 'lname', 'email', 'phone', 'password'];

    protected $selection = ['uuid as index', 'fname as first_name', 'lname as last_name', 'email as email_address', 'phone as phone_number'];

    public function get_administrator(int $id): array|string
    {
        $query = self::select($this->selection)->find($id);
        return ($query != null) ? $query->toArray() : [];
    }

    public function get_administrator_id(string $uuid): array|string
    {
        $query = self::select("id")->where(['uuid' => $uuid])->first();
        return ($query != null) ? $query->toArray()['id'] : 0;
    }

    public function get_administrator_email_phone(string $email_phone): array|string
    {
        $query = self::select($this->selection)->where(['email' => $email_phone])->orWhere(['phone' => $email_phone])->first();
        return ($query != null) ? $query->toArray() : [];
    }

    public function get_administrator_email(string $email): array|string
    {
        $query = self::select($this->selection)->where(['email' => $email])->first();
        return ($query != null) ? $query->toArray() : [];
    }

    public function get_administrator_password(int $id): array|string
    {
        $query = self::select("password")->find($id);
        return ($query != null) ? $query->toArray() : [];
    }

    public function update_administrator(int $id, array $data): int|string
    {
        $current_data = self::find($id);
        $new_data = ($current_data != null) ? array_diff_assoc($data, $current_data->toArray()) : [];
        if (!empty($new_data)) {
            return self::where(['id' => $id])->update($new_data);
        }
        return "nnd";
    }

    public function update_administrator_password(int $id, string $password): int|string
    {
        return self::where(['id' => $id])->update(['password' => password_hash($password, PASSWORD_DEFAULT)]);
    }
}

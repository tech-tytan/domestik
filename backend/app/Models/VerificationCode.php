<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use App\Traits\HasUuid;

class VerificationCode extends Model
{
    use HasUuid;

    protected $fillable = ['uuid', 'email', 'code', 'expires_at', 'req_count', 'blocked_until', 'duration'];

    protected $selection = ['uuid as index', 'email as email_address', 'code as verification_code', 'expires_at as expiration_date', 'req_count as count', 'blocked_until as until', 'duration as period'];

    protected static function booted()
    {
        parent::booted();
    }

    public function get_verification_code(string $email): array|string
    {
        $query = self::select($this->selection)->where(['email' => $email])->first();
        return ($query != null) ? $query->toArray() : [];
    }

    public function add_verification_code(array $data): int|string
    {
        return self::create($data)->id;
    }

    public function update_verification_code(string $email, array $data): int|string
    {
        return self::where(['email' => $email])->update($data);
    }

    public function delete_verification_code(string $email): int|string
    {
        return self::where(['email' => $email])->delete();
    }
}

<?php

namespace App\Models;

// use Illuminate\Contracts\Auth\MustVerifyEmail;
use Database\Factories\UserFactory;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use App\Traits\HasUuid;
use Laravel\Sanctum\HasApiTokens;

class User extends Authenticatable
{
    // /** @use HasFactory<UserFactory> */
    // use HasFactory, Notifiable;

    // /**
    //  * The attributes that are mass assignable.
    //  *
    //  * @var list<string>
    //  */
    // protected $fillable = [
    //     'name',
    //     'email',
    //     'password',
    // ];

    // /**
    //  * The attributes that should be hidden for serialization.
    //  *
    //  * @var list<string>
    //  */
    // protected $hidden = [
    //     'password',
    //     'remember_token',
    // ];

    // /**
    //  * Get the attributes that should be cast.
    //  *
    //  * @return array<string, string>
    //  */
    // protected function casts(): array
    // {
    //     return [
    //         'email_verified_at' => 'datetime',
    //         'password' => 'hashed',
    //     ];
    // }

    use HasUuid;

    protected $fillable = ['uuid', 'fname', 'lname', 'email', 'phone', 'address', 'password', 'status', 'location_id'];

    protected $selection = ['users.uuid as index', 'fname as first_name', 'lname as last_name', 'email as email_address', 'phone as phone_number', 'address as home_address', 'users.status as state', 'locations.uuid as location_index', 'locations.name as location', 'areas.name as city_town', 'states.name as region'];

    protected static function booted()
    {
        parent::booted();
    }

    public function get_users(string $search = "", array $filter = [], array $sort = [], string $paginate = "yes", string $count = "no"): array|string
    {
        $query = self::select($this->selection)->join("locations", "location_id", "=", "locations.id")->join("areas", "locations.area_id", "=", "areas.id")->join("states", "locations.state_id", "=", "states.id");
        if (!empty($search)) {
            $query = $query->whereAny(['fname', 'lname', 'email', 'phone'], "like", "%$search%");
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
        $query = $query->orderBy("users.id", "desc");
        if ($paginate == "yes") {
            $query = $query->paginate(10);
        } else {
            $query = $query->get();
        }
        return $query->toArray();
    }

    public function get_user(int $id): array|string
    {
        $query = self::select($this->selection)->join("locations", "location_id", "=", "locations.id")->join("areas", "locations.area_id", "=", "areas.id")->join("states", "locations.state_id", "=", "states.id")->find($id);
        return ($query != null) ? $query->toArray() : [];
    }

    public function get_user_id(string $uuid): array|string
    {
        $query = self::select("id")->where(['uuid' => $uuid])->first();
        return ($query != null) ? $query->toArray()['id'] : 0;
    }

    public function get_user_email_phone(string $email_phone): array|string
    {
        $query = self::select($this->selection)->where(['email' => $email_phone])->orWhere(['phone' => $email_phone])->join("locations", "location_id", "=", "locations.id")->join("areas", "locations.area_id", "=", "areas.id")->join("states", "locations.state_id", "=", "states.id")->first();
        return ($query != null) ? $query->toArray() : [];
    }

    public function get_user_password(int $id): array|string
    {
        $query = self::select("password")->find($id);
        return ($query != null) ? $query->toArray() : [];
    }

    public function add_user(array $data): int|string
    {
        return self::create($data)->id;
    }

    public function update_user_status(int $id, string $status): int|string
    {
        return self::where([['id', '=', $id], ['status', '!=', $status]])->update(['status' => $status]);
    }

    public function update_user(int $id, array $data): int|string
    {
        $current_data = self::find($id);
        $new_data = ($current_data != null) ? array_diff_assoc($data, $current_data->toArray()) : [];
        if (!empty($new_data)) {
            return self::where(['id' => $id])->update($new_data);
        }
        return "nnd";
    }

    public function update_user_password(int $id, string $password): int|string
    {
        return self::where(['id' => $id])->update(['password' => password_hash($password, PASSWORD_DEFAULT)]);
    }
}

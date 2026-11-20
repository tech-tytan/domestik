<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class State extends Model
{
    protected $selection = ['uuid as index', 'name as region'];

    public function get_states(string $search = "", array $filter = [], array $sort = [], string $paginate = "yes", string $count = "no"): array|string
    {
        $query = self::select($this->selection);
        if (!empty($search)) {
            $query = $query->where("name", "like", "%$search%");
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
        $query = $query->orderBy("id", "desc");
        if ($paginate == "yes") {
            $query = $query->paginate(10);
        } else {
            $query = $query->get();
        }
        return $query->toArray();
    }

    public function get_state(int $id): array|string
    {
        $query = self::select($this->selection)->find($id);
        return ($query != null) ? $query->toArray() : [];
    }

    public function get_state_id(string $uuid): array|string
    {
        $query = self::select("id")->where(['uuid' => $uuid])->first();
        return ($query != null) ? $query->toArray()['id'] : 0;
    }
}

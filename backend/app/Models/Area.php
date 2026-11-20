<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Area extends Model
{
    protected $selection = ['areas.uuid as index', 'areas.name as city_town'];

    public function get_areas(string $search = "", array $filter = [], array $sort = [], string $paginate = "yes", string $count = "no"): array|string
    {
        $query = self::select($this->selection)->join("states", "state_id", "=", "states.id");
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
        $query = $query->orderBy("areas.id", "desc");
        if ($paginate == "yes") {
            $query = $query->paginate(10);
        } else {
            $query = $query->get();
        }
        return $query->toArray();
    }

    public function get_area(int $id): array|string
    {
        $query = self::select($this->selection)->join("states", "state_id", "=", "states.id")->find($id);
        return ($query != null) ? $query->toArray() : [];
    }

    public function get_area_id(string $uuid): array|string
    {
        $query = self::select("id")->where(['uuid' => $uuid])->first();
        return ($query != null) ? $query->toArray()['id'] : 0;
    }
}

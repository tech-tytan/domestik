<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use App\Traits\HasUuid;

class Location extends Model
{
    use HasUuid;

    protected $fillable = ['uuid', 'name', 'status', 'area_id', 'state_id'];

    protected $selection = ['locations.uuid as index', 'locations.name as location', 'status as state', 'areas.uuid as city_town_index', 'areas.name as city_town', 'states.uuid as region_index', 'states.name as region'];

    protected static function booted()
    {
        parent::booted();
    }

    public function get_locations(string $search = "", array $filter = [], array $sort = [], string $paginate = "yes", string $count = "no"): array|string
    {
        $query = self::select($this->selection)->join("areas", "area_id", "=", "areas.id")->join("states", "locations.state_id", "=", "states.id");
        if (!empty($search)) {
            $query = $query->where("locations.name", "like", "%$search%");
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
        $query = $query->orderBy("locations.id", "desc");
        if ($paginate == "yes") {
            $query = $query->paginate(10);
        } else {
            $query = $query->get();
        }
        return $query->toArray();
    }

    public function get_location(int $id): array|string
    {
        $query = self::select($this->selection)->join("areas", "area_id", "=", "areas.id")->join("states", "locations.state_id", "=", "states.id")->find($id);
        return ($query != null) ? $query->toArray() : [];
    }

    public function get_location_id(string $uuid): array|string
    {
        $query = self::select("id")->where(['uuid' => $uuid])->first();
        return ($query != null) ? $query->toArray()['id'] : 0;
    }

    public function add_location(array $data): int|string
    {
        return self::create($data)->id;
    }

    public function update_location_status(int $id, string $status): int|string
    {
        return self::where([['id', '=', $id], ['status', '!=', $status]])->update(['status' => $status]);
    }

    public function update_location(int $id, array $data): int|string
    {
        $current_data = self::find($id);
        $new_data = ($current_data != null) ? array_diff_assoc($data, $current_data->toArray()) : [];
        if (!empty($new_data)) {
            return self::where(['id' => $id])->update($new_data);
        }
        return "nnd";
    }
}

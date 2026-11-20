<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Setting extends Model
{
    protected $fillable = ['value'];

    protected $selection = ['name as title', 'value as data'];

    public function get_settings(): array|string
    {
        return self::select($this->selection)->get()->toArray();
    }

    public function get_setting(string $name): array|string
    {
        $query = self::select($this->selection)->where(['name' => $name])->first();
        return ($query != null) ? $query->toArray() : [];
    }

    public function update_setting(string $name, string $value): int|string
    {
        return self::where([['name', '=', $name], ['value', '!=', $value]])->update(['value' => $value]);
    }
}

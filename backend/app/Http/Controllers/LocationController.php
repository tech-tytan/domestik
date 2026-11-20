<?php

namespace App\Http\Controllers;

use App\Models\Area;
use App\Models\Location;
use App\Models\State;
use Illuminate\Http\Request;

class LocationController extends Controller
{
    public function search_filter_sort($request)
    {
        $search = "";
        $filter = [];
        $area = new Area;
        $state = new State;
        if (isset($request->search) && !empty($request->search)) {
            $search = $request->search;
        }
        if (isset($request->city_town) && !empty($request->city_town)) {
            $filter['area_id'] = $area->get_area_id($request->city_town);
        }
        if (isset($request->region) && !empty($request->region)) {
            $filter['locations.state_id'] = $state->get_state_id($request->region);
        }
        if (isset($request->status) && ($request->status == "enabled" || $request->status == "disabled")) {
            $filter['status'] = $request->status;
        }
        return [$search, $filter];
    }

    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
    {
        $sfs = $this->search_filter_sort($request);
        $location = new Location;
        $area = new Area;
        $state = new State;
        if (isset($request->region_filter) && !empty($request->region_filter)) {
            return response()->json([
                'cities_towns' => $area->get_areas("", ['state_id' => $state->get_state_id($request->region_filter)], [], "no")
            ]);
        }
        return response()->json([
            'locations' => $location->get_locations($sfs[0], $sfs[1]),
            'locations_count' => $location->get_locations("", [], [], "no", "yes"),
            'locations_enabled_count' => $location->get_locations("", ['status' => 'enabled'], [], "no", "yes"),
            'locations_disabled_count' => $location->get_locations("", ['status' => 'disabled'], [], "no", "yes"),
            'regions' => $state->get_states("", [], [], "no")
        ]);
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
        $location = new Location;
        $area = new Area;
        $state = new State;
        if (isset($request->add)) {
            $request->validate([
                'name' => 'required|unique:locations,name|max:255',
                'city_or_town' => 'required',
                'state' => 'required'
            ]);
            $area_id = $area->get_area_id($request->city_or_town);
            if (empty($area->get_area($area_id))) {
                return response()->json([
                    'errors' => [
                        'city_or_town' => ['Invalid city or town.']
                    ]
                ], 422);
            }
            $state_id = $state->get_state_id($request->state);
            if (empty($state->get_state($state_id))) {
                return response()->json([
                    'errors' => [
                        'state' => ['Invalid state.']
                    ]
                ], 422);
            }
            $location->add_location([
                'name' => $request->name,
                'area_id' => $area_id,
                'state_id' => $state_id
            ]);
        }
        $data['regions'] = $state->get_states("", [], [], "no");
        return response()->json($data);
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        $data = [];
        $location = new Location;
        $area = new Area;
        $state = new State;
        if (isset(request()->region_filter) && !empty(request()->region_filter)) {
            $data['cities_towns'] = $area->get_areas("", ['state_id' => $state->get_state_id(request()->region_filter)], [], "no");
            return response()->json($data);
        }
        $id = $location->get_location_id($id);
        if (is_numeric($id)) {
            $data['location'] = $location->get_location($id);
            $data['cities_towns'] = (!empty($data['location'])) ? $area->get_areas("", ['state_id' => $state->get_state_id($data['location']['region_index'])], [], "no") : [];
        }
        $data['regions'] = $state->get_states("", [], [], "no");
        return response()->json($data);
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
        $data = [];
        $location = new Location;
        $area = new Area;
        $state = new State;
        $id = $location->get_location_id($id);
        if (isset($request->enable)) {
            $location->update_location_status($id, "enabled");
        }
        if (isset($request->disable)) {
            $location->update_location_status($id, "disabled");
        }
        if (isset($request->edit)) {
            $request->validate([
                'name' => 'required|unique:locations,name,' . $id . '|max:255',
                'city_or_town' => 'required',
                'state' => 'required'
            ]);
            $area_id = $area->get_area_id($request->city_or_town);
            if (empty($area->get_area($area_id))) {
                return response()->json([
                    'errors' => [
                        'city_or_town' => ['Invalid city or town.']
                    ]
                ], 422);
            }
            $state_id = $state->get_state_id($request->state);
            if (empty($state->get_state($state_id))) {
                return response()->json([
                    'errors' => [
                        'state' => ['Invalid state.']
                    ]
                ], 422);
            }
            $location->update_location($id, [
                'name' => $request->name,
                'area_id' => $area_id,
                'state_id' => $state_id
            ]);
        }
        if (is_numeric($id)) {
            $data['location'] = $location->get_location($id);
            $data['cities_towns'] = (!empty($data['location'])) ? $area->get_areas("", ['state_id' => $state->get_state_id($data['location']['region_index'])], [], "no") : [];
        }
        $data['regions'] = $state->get_states("", [], [], "no");
        return response()->json($data);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        //
    }
}

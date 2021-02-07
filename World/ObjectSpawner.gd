extends Node

var tiles = []
var map_size = Vector2()

var number_of_parked_cars = 100
var numnber_of_billboards = 75
var number_of_traffic_cones = 40
var number_of_hydrants = 50
var number_of_streetlights = 50
var number_of_ramps = 25
var number_of_scaffolding = 25

func generate_props(tile_list,size):
	tiles = tile_list
	map_size = size
	place_cars()
	place_billboards()
	place_traffic_cones()
	place_hydrants()
	place_streetlights() 
	place_scaffolding()
	
	
func random_tile(tile_count):
	var tiles_list = tiles
	var selected_tiles = []
	tiles_list.shuffle()
	for i in range(tile_count):
		var tile = tiles_list[i]
		selected_tiles.append(tile)
	return selected_tiles
	
func place_cars():
	var tiles_list = random_tile(number_of_parked_cars + number_of_ramps)
	for i in range(number_of_parked_cars):
		var tile = tiles_list[0]
		var tile_type = get_node("..").get_cell_item(tile.x,0,tile.z)
		var allowed_rotations = $ObjectRotLookup.lookup_rotation(tile_type)
		if not allowed_rotations == null:
			var tile_rotation = allowed_rotations[randi() % allowed_rotations.size() - 1] * -1
			tile.y = tile.y + 0.5
			rpc("spawn_cars",tile,tile_rotation)
		tiles_list.pop_front()
	place_ramps(tiles_list)
			
sync func spawn_cars(tile,car_rotation):
	var car = preload("res://Props/ParkedCars.tscn").instance()
	car.translation = Vector3((tile.x * 20 ) + 10, tile.y,(tile.z * 20) + 10)
	car.rotation_degrees.y = car_rotation
	add_child(car)
	
	
func place_ramps(tiles_list):
	for i in range(number_of_ramps):
		var tile = tiles_list[0]
		var tile_type = get_node("..").get_cell_item(tile.x,0,tile.z)
		var allowed_rotations = $ObjectRotLookup.lookup_rotation(tile_type)
		if not allowed_rotations == null:
			var tile_rotation = allowed_rotations[randi() % allowed_rotations.size() - 1] * -1
			tile.y = tile.y + 0.5
			rpc("spawn_ramps",tile,tile_rotation)
		tiles_list.pop_front() 
			
sync func spawn_ramps(tile,ramp_rotation):
	var ramp = preload("res://Props/Dumpster/Dumpster.tscn").instance()
	ramp.translation = Vector3((tile.x * 20 ) + 10, tile.y,(tile.z * 20) + 10)
	ramp.rotation_degrees.y = ramp_rotation
	add_child(ramp)
	
func place_billboards():
	var tiles_list = random_tile(numnber_of_billboards)
	for i in range(numnber_of_billboards):
		var tile = tiles_list[0]
		var tile_type = get_node("..").get_cell_item(tile.x,0,tile.z)
		var allowed_rotations = $ObjectRotLookup.lookup_rotation(tile_type)
		if not allowed_rotations == null:
			var tile_rotation = allowed_rotations[randi() % allowed_rotations.size() - 1] * -1
			tile.y = tile.y + 0.5
			rpc("spawn_billboards",tile,tile_rotation)
		tiles_list.pop_front()
			
sync func spawn_billboards(tile,billboard_rotation):
	var billboard = preload("res://Props/Billboards/Billboard.tscn").instance()
	billboard.translation = Vector3((tile.x * 20 ) + 10, tile.y,(tile.z * 20) + 10)
	billboard.rotation_degrees.y = billboard_rotation
	add_child(billboard)
	
func place_traffic_cones():
	var tiles_list = random_tile(number_of_traffic_cones)
	for i in range(number_of_traffic_cones):
		var tile = tiles_list[0]
		var tile_type = get_node("..").get_cell_item(tile.x,0,tile.z)
		var allowed_rotations = $ObjectRotLookup.lookup_rotation(tile_type)
		if not allowed_rotations == null:
			var tile_rotation = allowed_rotations[randi() % allowed_rotations.size() - 1] * -1
			tile.y = tile.y + 0.5
			rpc("spawn_traffic_cones",tile,tile_rotation)
		tiles_list.pop_front()
			
sync func spawn_traffic_cones(tile,traffic_cones_rotation):
	var traffic_cone = preload("res://Props/TrafficCones/TrafficCones.tscn").instance()
	traffic_cone.translation = Vector3((tile.x * 20 ) + 10, tile.y,(tile.z * 20) + 10)
	traffic_cone.rotation_degrees.y = traffic_cones_rotation
	add_child(traffic_cone,true)
	
func place_hydrants():
	var tiles_list = random_tile(number_of_hydrants)
	for i in range(number_of_hydrants):
		var tile = tiles_list[0]
		var tile_type = get_node("..").get_cell_item(tile.x,0,tile.z)
		var allowed_rotations = $ObjectRotLookup.lookup_rotation(tile_type)
		if not allowed_rotations == null:
			var tile_rotation = allowed_rotations[randi() % allowed_rotations.size() - 1] * -1
			tile.y = tile.y + 0.5
			rpc("spawn_hydrants",tile,tile_rotation)
		tiles_list.pop_front()
			
sync func spawn_hydrants(tile,hydrants_rotation):
	var hydrant = preload("res://Props/Hydrant/Hydrant.tscn").instance()
	hydrant.translation = Vector3((tile.x * 20 ) + 10, tile.y,(tile.z * 20) + 10)
	hydrant.rotation_degrees.y = hydrants_rotation
	add_child(hydrant,true)
	
func place_streetlights():
	var tiles_list = random_tile(number_of_streetlights)
	for i in range(number_of_streetlights):
		var tile = tiles_list[0]
		var tile_type = get_node("..").get_cell_item(tile.x,0,tile.z)
		var allowed_rotations = $ObjectRotLookup.lookup_rotation(tile_type)
		if not allowed_rotations == null:
			var tile_rotation = allowed_rotations[randi() % allowed_rotations.size() - 1] * -1
			tile.y = tile.y + 0.5
			rpc("spawn_streetlights",tile,tile_rotation)
		tiles_list.pop_front()
			
sync func spawn_streetlights(tile,streetlights_rotation):
	var streetlight = preload("res://Props/StreetLight/StreetLight.tscn").instance()
	streetlight.translation = Vector3((tile.x * 20 ) + 10, tile.y,(tile.z * 20) + 10)
	streetlight.rotation_degrees.y = streetlights_rotation
	add_child(streetlight,true)
	
func place_scaffolding():
	var tiles_list = random_tile(number_of_scaffolding)
	for i in range(number_of_scaffolding):
		var tile = tiles_list[0]
		var tile_type = get_node("..").get_cell_item(tile.x,0,tile.z)
		var allowed_rotations = $ObjectRotLookup.lookup_rotation(tile_type) 
		if not allowed_rotations == null:
			var tile_rotation = allowed_rotations[randi() % allowed_rotations.size() - 1] * -1
			tile.y = tile.y + 0.5
			rpc("spawn_scaffolding",tile,tile_rotation)
		tiles_list.pop_front()
			
sync func spawn_scaffolding(tile,scaffolding_rotation):
	var scaffolding = preload("res://Props/Scaffolding/Scaffolding.tscn").instance()
	scaffolding.translation = Vector3((tile.x * 20 ) + 10, tile.y,(tile.z * 20) + 10)
	scaffolding.rotation_degrees.y = scaffolding_rotation
	add_child(scaffolding)
	
	

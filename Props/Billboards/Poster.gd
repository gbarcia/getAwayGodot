extends CSGBox

func _ready() -> void:
	var selected_material = picked_random_material()
	material = load(selected_material)
	
	

func picked_random_material():
	var material_list = get_files("res://Props/Billboards/BillboardMaterials/")
	var selected_material = material_list[randi() % material_list.size()]
	return selected_material

func get_files(folder):
	var gathered_files = {}
	var file_count = 0
	var dir = Directory.new()
	
	dir.open(folder)
	dir.list_dir_begin()
	
	while true:
		var file = dir.get_next()
		if file == "":
			break
		elif not file.begins_with("."):
			gathered_files[file_count] = folder + file
			file_count += 1
	return gathered_files
		
		
		
		
		
		
		
		

extends Node

var save_data = {}
const SAVE_GAME = "user://SaveGame.json"

func _ready() -> void:
	save_data = get_data()

func get_data():
	var file = File.new()
	if not file.file_exists(SAVE_GAME):
		save_data = {"Player_name": "Unnamend"}
		save_game()
	file.open(SAVE_GAME,File.READ)
	var content = file.get_as_text()
	var data = parse_json(content)
	save_data = data
	file.close()
	return data
	
func save_game():
	var save_game = File.new()
	save_game.open(SAVE_GAME,File.WRITE)
	save_game.store_line(to_json(save_data))

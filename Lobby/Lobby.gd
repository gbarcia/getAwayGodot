extends Control

onready var NameTextBox = $VBoxContainer/CenterContainer/GridContainer/NameTextbox
onready var port = $VBoxContainer/CenterContainer/GridContainer/PortTextbox
onready var selected_ip = $VBoxContainer/CenterContainer/GridContainer/IPTextbox

func _ready() -> void:
	NameTextBox.text = SaveGame.save_data["Player_name"]
	port.text = str(Network.DEFAULT_PORT)
	selected_ip.text = Network.DEFAULT_IP

func _on_HostButton_pressed() -> void:
	Network.selected_port = int(port.text)
	Network.create_server()
	get_tree().call_group("HostOnly","show")
	create_waiting_room()


func _on_JoinButton_pressed() -> void:
	Network.selected_ip = selected_ip.text
	Network.selected_port = int(port.text)
	Network.connect_to_server()
	create_waiting_room()


func _on_NameTextbox_text_changed(new_text: String) -> void:
	SaveGame.save_data["Player_name"] = NameTextBox.text 
	SaveGame.save_game()
	
func create_waiting_room():
	$WaitingRoom.popup_centered()
	$WaitingRoom.refresh_players(Network.players)


func _on_ReadyButton_pressed() -> void:
	Network.start_game()

extends Node

const DEFAULT_IP = "127.0.0.1"
const DEFAULT_PORT = 32023
const MAX_PLAYERS = 4

var local_player_id = 0
var selected_port
var selected_ip

sync var players = {}
sync var player_data = {}
var ready_players = 0

signal player_disconnected
signal server_disconnected

func _ready() -> void:
	get_tree().connect("network_peer_disconnected", self,"_on_player_disconnected")
	get_tree().connect("network_peer_connected", self,"_on_player_connected")
	
func create_server():
	var peer = NetworkedMultiplayerENet.new()
	peer.create_server(selected_port,MAX_PLAYERS)
	get_tree().set_network_peer(peer)
	add_player_to_list()
	
func connect_to_server():
	var peer = NetworkedMultiplayerENet.new()
	get_tree().connect("connected_to_server",self,"_connected_to_server")
	peer.create_client(selected_ip,selected_port)
	get_tree().set_network_peer(peer)
	add_player_to_list()
	
func add_player_to_list():
	local_player_id = get_tree().get_network_unique_id()
	player_data = SaveGame.save_data
	players[local_player_id] = player_data
	
func _connected_to_server():
	add_player_to_list()
	rpc("send_player_info",local_player_id, player_data)
	
remote func send_player_info(id, player_info):
	players[id] =player_info
	if local_player_id == 1:
		rset("players",players)
		rpc("update_waiting_room")
		
func _on_player_connected(id):
	if not get_tree().is_network_server():
		print (str(id) + " has connected")
		
sync func update_waiting_room():
	get_tree().call_group("WaitingRoom","refresh_players", players)
	
func start_game():
	rpc("load_world")
	
sync func load_world():
	get_tree().change_scene("res://World/World.tscn")











extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Lobby.player_connected.connect(_who_connected)


func _who_connected(peer_id, player_info):
	print("peer id: %s, player_info: %s" % [str(peer_id), str(player_info)])


func _on_host_pressed() -> void:
	var error = Lobby.create_game()
	if error:
		return
	$Start.show()
	$Join.hide()
	$Host.hide()


func _on_join_pressed() -> void:
	var error = Lobby.join_game("127.0.0.1")
	if error:
		return
	$Join.hide()
	$Host.hide()


func _on_start_pressed() -> void:
	print(Lobby.players)
	Lobby.load_game.rpc("res://others for now/game_board.tscn")

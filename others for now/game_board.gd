extends Node2D

var player_ids: Array[int]
var player_list: Array[Player]

func _ready():
	# Preconfigure game.
	Lobby.player_loaded.rpc_id(1) # Tell the server that this peer has loaded.


# Called only on the server.
func start_game():
	print("all peers in, game starting")
	print(multiplayer.get_unique_id())
	print("found at number: ", Lobby.players)
	# All peers are ready to receive RPCs in this scene.

	player_ids.assign(Lobby.players.keys()) # cause it doesnt like to convert from unspecificed to specified
	print(player_ids)
	player_ids.shuffle()
	print(player_ids)
	print("calling set player order")
	_set_player_order.rpc(player_ids)


@rpc("authority", "call_local", "reliable")
func _set_player_order(ids: Array[int]):
	var num_players: int = ids.size()
	var offset: int = 0
	for i in range(num_players):
		var player_node = load("uid://d3s2i1poc30t6").instantiate()
		add_child(player_node)
		player_list.append(player_node)
		if ids[i] == multiplayer.get_unique_id():
			offset = i
	print("id: ", multiplayer.get_unique_id(), " , offset: ", offset, ", list: ", player_list)
	
	for i in range(num_players):
		var player: Player = player_list[i]
		var pos: int = i - offset if i - offset > 0 else i - offset + num_players
		player.set_player_area(pos, num_players)
		print(pos)

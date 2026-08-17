extends Node2D

func _ready():
	# Preconfigure game.
	Lobby.player_loaded.rpc_id(1) # Tell the server that this peer has loaded.


# Called only on the server.
func start_game():
	print("all peers in, game starting")
	print(multiplayer.get_unique_id())
	pass
	# All peers are ready to receive RPCs in this scene.

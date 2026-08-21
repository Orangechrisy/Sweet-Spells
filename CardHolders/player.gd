class_name Player extends Node2D

@export var hand: Array[CardBase] = []
@export var player_number: int = 0
@export var mana: int
@export var points: int

enum Pos {BOTTOM, TOP, LEFT, RIGHT}
var players: Array[int] = []


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# dont do this here, do it in game manager
	players.resize(Lobby.players.size())
	make_player_array()
	set_player_area(player_number)

func make_player_array():
	for info in Lobby.players:
		players[Lobby.players[info]["table_pos"]] = info
	print(players)

func set_player_area(player_position):
	match player_position:
		Pos.BOTTOM:
			$Area2D/CollisionShape2D.position.x = get_viewport().size.x / 2
			$Area2D/CollisionShape2D.position.y = get_viewport().size.y * 5 / 6
			$Area2D/CollisionShape2D.shape.size.x = get_viewport().size.x / 3
			$Area2D/CollisionShape2D.shape.size.y = get_viewport().size.y /3
		Pos.TOP:
			$Area2D/CollisionShape2D.position.x = get_viewport().size.x / 2
			$Area2D/CollisionShape2D.position.y = get_viewport().size.y / 6
			$Area2D/CollisionShape2D.shape.size.x = get_viewport().size.x / 3
			$Area2D/CollisionShape2D.shape.size.y = get_viewport().size.y /3
		Pos.LEFT:
			pass
		Pos.RIGHT:
			pass


func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed:
		print("player %s clicked" % str(player_number))
		get_viewport().set_input_as_handled()
		player_area_clicked.rpc()

@rpc("any_peer", "call_local", "reliable")
func player_area_clicked():
	print("sender id: ", multiplayer.get_remote_sender_id())
	print("my own id: ", multiplayer.get_unique_id())

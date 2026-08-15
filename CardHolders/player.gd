extends Node2D

@export var hand: Array[CardBase] = []
@export var player_number: int = 0
@export var mana: int
@export var points: int


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
	if player_number == 0:
		$Area2D/CollisionShape2D.position.x = get_viewport().size.x / 2
		$Area2D/CollisionShape2D.position.y = get_viewport().size.y * 5 / 6
		$Area2D/CollisionShape2D.shape.size.x = get_viewport().size.x / 3
		$Area2D/CollisionShape2D.shape.size.y = get_viewport().size.y /3
	else:
		$Area2D/CollisionShape2D.position.x = get_viewport().size.x / 2
		$Area2D/CollisionShape2D.position.y = get_viewport().size.y / 6
		$Area2D/CollisionShape2D.shape.size.x = get_viewport().size.x / 3
		$Area2D/CollisionShape2D.shape.size.y = get_viewport().size.y /3


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

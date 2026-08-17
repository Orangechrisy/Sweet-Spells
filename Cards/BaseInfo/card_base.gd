class_name CardBase extends Node2D

signal card_drawn
signal card_played(targets)
signal card_destroyed

@export var card_data: CardData

func _ready() -> void:
	# Initialize from card_data
	# set various node values with card_data
	# ie find the node for the image and set it to card_data.image
	# or have a separate scene for the control nodes and have a function
	# there that takes in card_data and sets them itself rather than from here
	pass

func draw_card() -> void:
	emit_signal("card_drawn")
	
func play(targets = []) -> void:
	emit_signal("card_played", targets)
	
func destroy() -> void:
	emit_signal("card_destroyed")
	queue_free()

# Add effects through code rather than scene hierarchy
#func add_effect(effect: Effect) -> void:
	#effects.append(effect)


func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	pass # Replace with function body.


func _on_area_2d_mouse_entered() -> void:
	pass # Replace with function body.


func _on_area_2d_mouse_exited() -> void:
	pass # Replace with function body.

extends Resource
class_name CardData

@export var name: StringName
@export var image: Texture2D
@export var description: StringName
@export_category("Data")
@export_flags("Food:1", "Spell:2", "Food and Spell:3") var card_type = 0
@export var effect: CardEffect

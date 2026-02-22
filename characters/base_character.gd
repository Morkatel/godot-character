extends Area2D
class_name BaseCharacter

@export var SCALE = 1.0

func _ready() -> void:
	area_entered.connect(_on_area_entered)
	
func _on_area_entered(area: Area2D) -> void:
	print("Collision")

func get_buff_effect() -> BuffEffect:
	return null

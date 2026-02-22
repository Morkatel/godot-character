extends BaseCharacter
class_name GreenCharacter

signal collided_with_player(GreenCharacter)

func _on_area_entered(area: Area2D) -> void:
	print("Green handler")
	super._on_area_entered(area)
	collided_with_player.emit(self)

func get_buff_effect() -> BuffEffect:
	return HpRegen.new()

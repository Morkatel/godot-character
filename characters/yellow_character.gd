extends BaseCharacter
class_name YellowCharacter

signal collided_with_player(YellowCharacter)

func _on_area_entered(area: Area2D) -> void:
	print("Yellow handler")
	super._on_area_entered(area)
	collided_with_player.emit(self)

func get_buff_effect() -> BuffEffect:
	return SpeedBuff.new()

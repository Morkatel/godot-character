extends BaseCharacter
class_name RedCharacter

signal collided_with_player(RedCharacter)

func _on_area_entered(area: Area2D) -> void:
	print("Red handler")
	super._on_area_entered(area)
	collided_with_player.emit(self)

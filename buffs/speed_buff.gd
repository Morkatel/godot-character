extends BuffEffect
class_name SpeedBuff

var original_speed := .0

func on_update(target: BaseCharacter, _delta: float):
	original_speed = target.mod_speed(150)

func on_remove(target: BaseCharacter) -> void:
	target.mod_speed(original_speed)

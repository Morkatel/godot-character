extends Resource
class_name BuffEffect

var time_left: float = INF

func on_apply(_target: BaseCharacter) -> void:
	pass

func on_update(_target: BaseCharacter, _delta: float) -> void:
	pass

func on_remove(_target: BaseCharacter) -> void:
	pass

func has_time_left() -> bool:
	return time_left != INF and time_left > 0.0

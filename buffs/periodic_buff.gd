extends BuffEffect
class_name PeriodicBuff

@export var interval := 1.0
@export var duration := 5.0

var next_tick := 0.0

func on_apply(_target: BaseCharacter) -> void:
	next_tick = interval
	time_left = duration

func on_update(target: BaseCharacter, delta: float):
	time_left -= delta
	next_tick -= delta
	
	if next_tick <= 0:
		apply_periodic_effect(target)
		next_tick += interval

func apply_periodic_effect(_target: BaseCharacter) -> void:
	pass

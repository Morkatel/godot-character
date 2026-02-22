extends PeriodicBuff
class_name HpRegen

func apply_periodic_effect(target: BaseCharacter) -> void:
	target.mod_health(15)

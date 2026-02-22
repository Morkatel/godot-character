extends BaseCharacter
class_name BlueCharacter

const DEFAULT_SPEED := 500.0

@export var speed: float = DEFAULT_SPEED
@export var health: float = 500.0

var buff_effect_list: Array[BuffEffectInstance]

func _ready() -> void:
	scale *= SCALE
	$ResourceBar.set_value(health)

func mod_health(by_val: float) -> void:
	print(health)
	health += by_val
	$ResourceBar.set_value(health)

func mod_speed(by_val: float) -> float:
	var orig_speed := speed
	speed += by_val
	return orig_speed

func _process(delta: float) -> void:
	_move_logic(delta)
	apply_buffs(delta)
		
func apply_buffs(delta: float) -> void:
	for i in range(buff_effect_list.size() - 1, -1, -1):
		var b := buff_effect_list[i]
		
		# 2. Update hook
		b.strategy.on_update(self , delta)
		
		# 3. Teardown hook
		if !b.strategy.has_time_left():
			b.strategy.on_remove(self )
			buff_effect_list.remove_at(i)

func _move_logic(delta: float) -> void:
	var dir := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	position += dir * speed * delta

func _on_area_entered(area: Area2D) -> void:
	super._on_area_entered(area)
	print("Blue handler")

func buff(effect: BuffEffect):
	var b = BuffEffectInstance.new(effect)
	b.strategy.on_apply(self )
	buff_effect_list.append(b)

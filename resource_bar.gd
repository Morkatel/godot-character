extends Node2D

@export var default_min := 0.0
@export var default_max := 500.0
@export var default_value := 500.0

func _ready():
	$TextureProgressBar.min_value = default_min
	$TextureProgressBar.max_value = default_max
	$TextureProgressBar.value = default_value

func set_value(new_val: float) -> void:
	$TextureProgressBar.value = new_val
	_update_label()

func _update_label():
	$Label.text = "%.0f/%.0f" % [$TextureProgressBar.value, $TextureProgressBar.max_value]

extends Node2D

var blue_char = preload("res://characters/blue_character.tscn")
var red_char = preload("res://characters/red_character.tscn")
var yel_char = preload("res://characters/yellow_character.tscn")
var grn_char = preload("res://characters/green_character.tscn")

var game_manager := GameManager.new()
var char_one: BlueCharacter = null

func _ready():
	char_one = blue_char.instantiate() as BlueCharacter
	add_child(char_one)
	
	var char_two = red_char.instantiate() as RedCharacter
	char_two.position = Vector2(100,100)
	add_child(char_two)

	game_manager.observe(char_two)
	
	game_manager.request_spawn_enemy.connect(on_spawn_enemy_requested)

func on_spawn_enemy_requested(char: BaseCharacter) -> void:
	print("LevelOne on_spawn_enemy_requested")
	if char is RedCharacter:
		char_one.mod_health(-200)
	
	var buff_effect := char.get_buff_effect()
	if buff_effect:
		char_one.buff(buff_effect)
	
	char.queue_free()
	
	var new_enemy = null
	var selector_index = randi_range(0, 2)
	match selector_index:
		0: new_enemy = red_char.instantiate() 
		1: new_enemy = yel_char.instantiate()
		2: new_enemy = grn_char.instantiate()
		
	if not new_enemy:
		print("not instantiated")
		return
	
	var screen_rect := get_viewport().get_visible_rect()
	var padding := 64
	
	# Calculate limits with padding to keep the sprite fully inside
	var spawn_area := get_viewport().get_visible_rect().grow(-padding)
	
	var attempts := 0
	const MAX_ATTEMPTS := 50

	# Cache the polygon and transform for performance
	var poly_node := char_one.get_node("CollisionPolygon2D") as CollisionPolygon2D
	var polygon := poly_node.polygon
	var poly_transform := poly_node.global_transform

	while attempts < MAX_ATTEMPTS:
		var candidate := Vector2(
			randf_range(spawn_area.position.x, spawn_area.end.x),
			randf_range(spawn_area.position.y, spawn_area.end.y)
		)
		
		# Transform point into the polygon's local coordinate space
		var local_point := poly_transform.affine_inverse() * candidate
		
		if not Geometry2D.is_point_in_polygon(local_point, polygon):
			new_enemy.position = candidate
			print("setpos")
			break
		attempts += 1
		
	if attempts != MAX_ATTEMPTS:
		print("adding")
		add_child(new_enemy)
		game_manager.observe(new_enemy)
	else:
		print("skip")

extends Node
class_name GameManager

signal request_spawn_enemy

func observe(character: BaseCharacter) -> void:
	print("observe")
	character.collided_with_player.connect(on_enemy_collided_with_player)

func on_enemy_collided_with_player(enemy: BaseCharacter):
	print("collided, emit request_spawn_enemy")
	request_spawn_enemy.emit(enemy)

class_name EnemyManager
extends Node


func _ready() -> void:
	GameEvents.bonus_picked.connect(on_bonus_picked)
	
	
func change_enemy_move_component_process(entities: Node2D, value: bool) -> void:
	for entity in entities.get_children():
		var enemy: BasicEnemy = entity as BasicEnemy
		enemy.move_component.set_process(value)
	
	
func on_bonus_picked(bonus: Bonus) -> void:
	var entities: Node2D = get_tree().get_first_node_in_group("entities") as Node2D
	if bonus.id != "freeze_enemies" or not entities:
		return
	change_enemy_move_component_process(entities, false)
	await get_tree().create_timer(bonus.duration).timeout
	change_enemy_move_component_process(entities, true)
	

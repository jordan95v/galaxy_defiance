class_name EnemyManager
extends Node

@onready var spawners: Array[EnemySpawnerComponent] = [
	$GreenEnemySpawnerComponent,
	$YellowEnemySpawnerComponent,
	$PinkEnemySpawnerComponent
]


func _ready() -> void:
	GameEvents.bonus_picked.connect(on_bonus_picked)
	
	
func freeze_enemies(entities: Node2D, value: bool) -> void:
	for entity in entities.get_children() as Array[BasicEnemy]:
		entity.move_component.set_process(value)
	
	
func on_bonus_picked(bonus: Bonus) -> void:
	var entities: Node2D = get_tree().get_first_node_in_group("entities") as Node2D
	if bonus.id != "freeze_enemies" or not entities:
		return
	freeze_enemies(entities, false)
	for spawner in spawners:
		spawner.suspend_spawn(bonus.duration)
	await get_tree().create_timer(bonus.duration).timeout
	freeze_enemies(entities, true)
	

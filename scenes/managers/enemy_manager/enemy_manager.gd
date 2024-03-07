class_name EnemyManager
extends Node

@onready var green_enemy_timer: Timer = $GreenEnemyTimer
@onready var window_rect: Rect2 = get_viewport().get_visible_rect()
@onready var spawn_component: SpawnComponent = $SpawnComponent
@export var margin: float = 10
@export var green_enemy_scene: PackedScene


func _ready() -> void:
	green_enemy_timer.timeout.connect(spawn_enemy.bind(green_enemy_scene))


func spawn_enemy(scene: PackedScene) -> void:
	spawn_component.scene = scene
	var random_x: float = randf_range(
		window_rect.position.x + margin, window_rect.size.x - margin
	)
	var entities: Node2D = get_tree().get_first_node_in_group("entities") as Node2D
	if not entities:
		return
	spawn_component.spawn(Vector2(random_x, -margin), entities)
	

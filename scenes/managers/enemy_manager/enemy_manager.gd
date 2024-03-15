class_name EnemyManager
extends Node

@onready var window_rect: Rect2 = get_viewport().get_visible_rect()
@onready var spawn_component: SpawnComponent = $SpawnComponent
@onready var green_enemy_timer: Timer = $GreenEnemyTimer
@onready var yellow_enemy_timer: Timer = $YellowEnemyTimer
@onready var pink_enemy_timer: Timer = $PinkEnemyTimer
@export var green_enemy_scene: PackedScene
@export var yellow_enemy_scene: PackedScene
@export var pink_enemy_scene: PackedScene
@export var margin: float = 10


func _ready() -> void:
	green_enemy_timer.timeout.connect(spawn_enemy.bind(green_enemy_scene))
	yellow_enemy_timer.timeout.connect(spawn_enemy.bind(yellow_enemy_scene))
	pink_enemy_timer.timeout.connect(spawn_enemy.bind(pink_enemy_scene))


func spawn_enemy(scene: PackedScene) -> void:
	var entities: Node2D = get_tree().get_first_node_in_group("entities") as Node2D
	if not scene or not entities:
		return
	var random_x: float = randf_range(
		window_rect.position.x + margin, window_rect.size.x - margin
	)
	spawn_component.scene = scene
	spawn_component.spawn(Vector2(random_x, -margin), entities)
	

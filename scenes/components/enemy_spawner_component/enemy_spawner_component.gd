class_name EnemySpawnerComponent
extends Node

@onready var window_rect: Rect2 = get_viewport().get_visible_rect()
@onready var spawn_component: SpawnComponent = $SpawnComponent
@onready var timer: Timer = $Timer
@export var enemy_scene: PackedScene
@export var wait_time: float = 5
@export var score_threshold: int = 0
var margin: int = 10


func _ready() -> void:
	spawn_component.scene = enemy_scene
	timer.start(wait_time)
	timer.timeout.connect(on_timer_timeout)
	
	
func get_random_spawn_position() -> Vector2:
	var random_x: float = randf_range(
		window_rect.position.x + margin, window_rect.size.x - margin
	)
	return Vector2(random_x, -margin)
	
	
func on_timer_timeout() -> void:
	var entities: Node2D = get_tree().get_first_node_in_group("entities") as Node2D
	var current_score: int = ResourcesHandler.game_stats.score
	if not enemy_scene or current_score < score_threshold or not entities:
		return
	spawn_component.spawn(get_random_spawn_position(), entities)


func suspend_spawn(duration: float) -> void:
	timer.start(duration)
	await timer.timeout
	timer.start(wait_time)

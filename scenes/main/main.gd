extends Node2D

@export var game_over_menu_scene: PackedScene
@onready var ship: Ship = $Ship


func _ready() -> void:
	ResourcesHandler.game_stats.score = 0
	GameEvents.enemy_killed.connect(on_enemy_killed)
	ship.tree_exited.connect(on_ship_died)
	
	
func on_enemy_killed(points: int) -> void:
	ResourcesHandler.game_stats.increment_score(points)


func on_ship_died() -> void:
	if not game_over_menu_scene:
		return
	var game_over_menu_instance: CanvasLayer = game_over_menu_scene.instantiate()
	add_child(game_over_menu_instance)

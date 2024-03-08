extends Node2D

@export var game_stats: GameStats
@export var game_over_menu_scene: PackedScene
@onready var ship: Ship = $Entities/Ship


func _ready() -> void:
	game_stats.score = 0
	ship.tree_exited.connect(on_ship_died)
	GameEvents.enemy_killed.connect(on_enemy_killed)
	
	
func on_enemy_killed(points: int) -> void:
	game_stats.increment_score(points)


func on_ship_died() -> void:
	if not game_over_menu_scene:
		return
	var game_over_menu_instance: CanvasLayer = game_over_menu_scene.instantiate()
	add_child(game_over_menu_instance)

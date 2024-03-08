extends Node2D

@export var game_over_menu_scene: PackedScene
@onready var ship: Ship = $Entities/Ship


func _ready() -> void:
	ship.tree_exited.connect(on_ship_died)


func on_ship_died() -> void:
	if not game_over_menu_scene:
		return
	var game_over_menu_instance: CanvasLayer = game_over_menu_scene.instantiate()
	add_child(game_over_menu_instance)

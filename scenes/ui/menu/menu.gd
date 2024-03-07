extends Control

var game_scene: PackedScene = load("res://scenes/main/main.tscn")


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("space"):
		get_tree().change_scene_to_packed(game_scene)

extends CanvasLayer

var menu_scene: PackedScene = load("res://scenes/ui/menu/menu.tscn")
var game_scene: PackedScene = load("res://scenes/main/main.tscn")

func _ready() -> void:
	get_tree().paused = true


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("space"):
		get_tree().paused = false
		get_tree().change_scene_to_packed(menu_scene)
	elif event.is_action_pressed("enter"):
		get_tree().paused = false
		get_tree().change_scene_to_packed(game_scene)

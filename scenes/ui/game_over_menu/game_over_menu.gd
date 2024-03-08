extends CanvasLayer

var menu_scene: PackedScene = load("res://scenes/ui/menu/menu.tscn")
var game_scene: PackedScene = load("res://scenes/main/main.tscn")


func _input(event: InputEvent) -> void:
	var actual_scene: PackedScene
	if event.is_action_pressed("space"):
		actual_scene = menu_scene
	elif event.is_action_pressed("enter"):
		actual_scene = game_scene
	if not actual_scene:
		return
	get_tree().change_scene_to_packed(actual_scene)

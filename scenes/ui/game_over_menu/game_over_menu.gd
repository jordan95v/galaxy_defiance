extends CanvasLayer

var menu_scene: PackedScene = load("res://scenes/ui/menu/menu.tscn")
var game_scene: PackedScene = load("res://scenes/main/main.tscn")
@onready var score_value_label: Label = %ScoreValueLabel
@onready var highscore_value_label: Label = %HighscoreValueLabel


func _ready() -> void:
	score_value_label.text = str(ResourcesHandler.game_stats.score)
	highscore_value_label.text = str(ResourcesHandler.game_stats.highscore)
	

func _input(event: InputEvent) -> void:
	var actual_scene: PackedScene
	if event.is_action_pressed("space"):
		actual_scene = menu_scene
	elif event.is_action_pressed("enter"):
		actual_scene = game_scene
	if not actual_scene:
		return
	get_tree().change_scene_to_packed(actual_scene)

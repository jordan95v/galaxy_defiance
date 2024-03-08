class_name GameStats
extends Resource

var score: int
var highscore: int


func increment_score(value: int) -> void:
	score += value
	GameEvents.score_changed.emit(score)

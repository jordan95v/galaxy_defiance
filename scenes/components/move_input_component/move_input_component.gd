extends Node

@export var move_component: MoveCompenent
@export var move_stats: MoveStats


func _input(_event: InputEvent) -> void:
	if not move_component:
		return
	var axis: float = Input.get_axis("bank_left", "bank_right")
	move_component.velocity = Vector2(axis * move_stats.speed, 0)

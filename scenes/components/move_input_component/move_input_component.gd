class_name MoveInputComponent
extends Node

@export var move_component: MoveComponent
@export var move_stats: MoveStats
var base_move_speed: float


func _ready() -> void:
	base_move_speed = move_stats.speed


func _input(_event: InputEvent) -> void:
	if not move_component:
		return
	var axis: float = Input.get_axis("bank_left", "bank_right")
	move_component.velocity = Vector2(axis * move_stats.speed, 0)


func upgrade_movement_speed(bonus: Bonus) -> void:
	move_stats.speed += bonus.value
	await get_tree().create_timer(bonus. duration).timeout
	move_stats.speed = base_move_speed

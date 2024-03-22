class_name MoveInputComponent
extends Node

@export var move_component: MoveComponent
@export var move_stats: MoveStats
var base_move_speed: float


func _ready() -> void:
	base_move_speed = move_stats.speed
	GameEvents.bonus_picked.connect(on_bonus_picked)


func _input(_event: InputEvent) -> void:
	if not move_component:
		return
	var axis: float = Input.get_axis("bank_left", "bank_right")
	move_component.velocity = Vector2(axis * move_stats.speed, 0)


func on_bonus_picked(bonus: Bonus) -> void:
	if not bonus.id == "move_speed":
		return
	var stats_bonus: StatBonus = bonus as StatBonus
	move_stats.speed += stats_bonus.value
	await get_tree().create_timer(stats_bonus.duration).timeout
	move_stats.speed = base_move_speed

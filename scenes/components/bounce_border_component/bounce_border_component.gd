extends Node

@export var actor: Node2D
@export var move_component: MoveComponent
@export var margin: float = 10
@onready var right_border: float = get_viewport().get_visible_rect().size.x


func _process(_delta: float) -> void:
	if not actor or not move_component:
		return
	var actor_x: float = actor.global_position.x
	if actor_x <= 0 + margin or actor_x >= right_border - margin:
		move_component.velocity.x *= -1

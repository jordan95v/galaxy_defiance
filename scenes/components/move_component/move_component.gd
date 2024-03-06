class_name MoveCompenent
extends Node

@export var actor: Node2D
@export var velocity: Vector2


func _process(delta: float) -> void:
	if not actor:
		return
	actor.translate(velocity * delta)

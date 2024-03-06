extends Node

@export var actor: Node2D
@export var margin: float = 8
@onready var right_border: float = get_viewport().get_visible_rect().size.x


func _process(_delta: float) -> void:
	if not actor:
		return
	actor.global_position.x = clamp(actor.global_position.x, 0 + margin, right_border - margin)

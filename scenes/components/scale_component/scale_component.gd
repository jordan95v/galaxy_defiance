class_name ScaleComponent
extends Node

@export var actor: Node2D
@export var target_scale: Vector2 = Vector2.ONE
@export var duration: float = 1

func tween_scale() -> void:
	if not actor:
		return
	
	var tween: Tween = create_tween().set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_CUBIC)
	tween.tween_property(actor, "scale", target_scale, duration * 0.1).from_current()
	tween.tween_property(actor, "scale", Vector2.ONE, duration * 0.9).from(target_scale)

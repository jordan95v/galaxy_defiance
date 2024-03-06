class_name ShakeComponent
extends Node

var shake_strength: float = 0
@export var sprite: AnimatedSprite2D


func apply_random_shake() -> void:
	shake_strength = randf_range(4, 8)


func _process(_delta: float) -> void:
	if not sprite or not shake_strength:
		return
	sprite.position = Vector2(
		randf_range(-shake_strength, shake_strength),
		randf_range(-shake_strength, shake_strength)		
	)
	shake_strength = move_toward(shake_strength, 0, 1)

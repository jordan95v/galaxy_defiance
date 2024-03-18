class_name ShakeComponent
extends Node

var shake_strength: float = 0
@export var sprite: AnimatedSprite2D
@export var min_shake_strength: int = 3
@export var max_shake_strength: int = 6


func apply_random_shake() -> void:
	shake_strength = randf_range(min_shake_strength, max_shake_strength)


func _process(_delta: float) -> void:
	if not sprite or not shake_strength:
		return
	sprite.position = Vector2(
		randf_range(-shake_strength, shake_strength),
		randf_range(-shake_strength, shake_strength)		
	)
	shake_strength = move_toward(shake_strength, 0, 1)

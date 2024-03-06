class_name ShakeComponent
extends Node

var shake_strength: float = 0
@export var sprite: AnimatedSprite2D
@export var hurtbox_component: HurtboxComponent
@export var scale_component: ScaleComponent


func _ready() -> void:
	hurtbox_component.hurt.connect(on_hurt)
	

func on_hurt() -> void:
	shake_strength = randf_range(4, 8)
	if not scale_component:
		return
	scale_component.tween_scale()


func _process(_delta: float) -> void:
	if not sprite:
		return
	sprite.position = Vector2(
		randf_range(-shake_strength, shake_strength),
		randf_range(-shake_strength, shake_strength)		
	)
	if not shake_strength:
		return
	shake_strength = move_toward(shake_strength, 0, 1)

class_name BasicEnemy
extends Node2D

@onready var visible_on_screen_notifier_2d: VisibleOnScreenNotifier2D = $VisibleOnScreenNotifier2D
@onready var health_component: HealthComponent = $HealthComponent
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var hurtbox_component: HurtboxComponent = $HurtboxComponent
@onready var hitbox_component: HitboxComponent = $HitboxComponent
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var scale_component: ScaleComponent = $ScaleComponent
@onready var shake_component: ShakeComponent = $ShakeComponent


func _ready() -> void:
	visible_on_screen_notifier_2d.screen_exited.connect(queue_free)
	health_component.no_health.connect(on_no_health)
	hurtbox_component.hurt.connect(on_hurt)
	
	
func on_hurt() -> void:
	scale_component.tween_scale()
	shake_component.apply_random_shake()
	animation_player.play("flash")


func on_no_health() -> void:
	animated_sprite_2d.play("die")
	hurtbox_component.set_deferred("monitoring", false)
	hitbox_component.set_deferred("monitorable", false)
	await animated_sprite_2d.animation_finished
	queue_free()

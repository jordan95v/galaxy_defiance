class_name Ship
extends Node2D

signal died
@onready var left_cannon: Marker2D = $LeftCannon
@onready var right_cannon: Marker2D = $RightCannon
@onready var fire_rate_timer: Timer = $FireRateTimer
@onready var animated_sprite_2d: AnimatedSprite2D = $Visuals/AnimatedSprite2D
@onready var flame_animated_sprite_2d: AnimatedSprite2D = $Visuals/FlameAnimatedSprite2D
@onready var spawn_component: SpawnComponent = $SpawnComponent
@onready var scale_component: ScaleComponent = $ScaleComponent
@onready var shake_component: ShakeComponent = $ShakeComponent
@onready var move_component: MoveComponent = $MoveComponent
@onready var hurtbox_component: HurtboxComponent = $HurtboxComponent
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var health_component: HealthComponent = $HealthComponent


func _ready() -> void:
	fire_rate_timer.timeout.connect(on_fire_rate_timer_timeout)
	hurtbox_component.hurt.connect(on_hurt)
	health_component.no_health.connect(on_no_health)
	
	
func _process(_delta: float) -> void:
	animate_ship()
	
	
func animate_ship() -> void:
	if not move_component:
		return
	var animation: String = ""
	if move_component.velocity.x < 0:
		animation = "bank_left"
	elif move_component.velocity.x > 0:
		animation = "bank_right"
	else:
		animation = "center"
	animated_sprite_2d.play(animation)
	flame_animated_sprite_2d.play(animation)
	

func on_fire_rate_timer_timeout() -> void:
	spawn_component.spawn(left_cannon.global_position)
	spawn_component.spawn(right_cannon.global_position)
	scale_component.tween_scale()
	

func on_hurt() -> void:
	scale_component.tween_scale()
	shake_component.apply_random_shake()
	animation_player.play("flash")
	
	
func on_no_health() -> void:
	set_process(false)
	move_component.set_process(false)
	flame_animated_sprite_2d.hide()
	animated_sprite_2d.play("explosion")
	await animated_sprite_2d.animation_finished
	died.emit()
	queue_free()

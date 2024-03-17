class_name Ship
extends Node2D

signal died
@onready var animated_sprite_2d: AnimatedSprite2D = $Visuals/AnimatedSprite2D
@onready var flame_animated_sprite_2d: AnimatedSprite2D = $Visuals/FlameAnimatedSprite2D
@onready var move_component: MoveComponent = $MoveComponent
@onready var move_input_component: Node = $MoveInputComponent
@onready var clamp_component: Node = $ClampComponent
@onready var spawn_component: SpawnComponent = $SpawnComponent
@onready var scale_component: ScaleComponent = $ScaleComponent
@onready var health_component: HealthComponent = $HealthComponent
@onready var shake_component: ShakeComponent = $ShakeComponent
@onready var destroyed_component: DestroyedComponent = $DestroyedComponent
@onready var fire_rate_timer: Timer = $FireRateTimer
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var hurtbox_component: HurtboxComponent = $HurtboxComponent
@onready var left_cannon: Marker2D = $LeftCannon
@onready var right_cannon: Marker2D = $RightCannon


func _ready() -> void:
	fire_rate_timer.timeout.connect(on_fire_rate_timer_timeout)
	hurtbox_component.hurt.connect(on_hurt)
	
	
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
	var projectiles_layer: Node2D = get_tree().get_first_node_in_group("projectiles")
	if not projectiles_layer:
		return
	spawn_component.spawn(left_cannon.global_position, projectiles_layer)
	spawn_component.spawn(right_cannon.global_position, projectiles_layer)
	scale_component.tween_scale()
	

func on_hurt() -> void:
	scale_component.tween_scale()
	shake_component.apply_random_shake()
	animation_player.play("flash")

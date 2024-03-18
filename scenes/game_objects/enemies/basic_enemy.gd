class_name BasicEnemy
extends Node2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var shake_component: ShakeComponent = $ShakeComponent
@onready var scale_component: ScaleComponent = $ScaleComponent
@onready var move_component: MoveComponent = $MoveComponent
@onready var health_component: HealthComponent = $HealthComponent
@onready var visible_on_screen_notifier_2d: VisibleOnScreenNotifier2D = $VisibleOnScreenNotifier2D
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var hurtbox_component: HurtboxComponent = $HurtboxComponent
@onready var hitbox_component: HitboxComponent = $HitboxComponent
@onready var destroyed_component: DestroyedComponent = $DestroyedComponent
@export var points: int = 5


func _ready() -> void:
	health_component.no_health.connect(on_no_health)
	visible_on_screen_notifier_2d.screen_exited.connect(on_screen_exited)
	hurtbox_component.hurt.connect(on_hurt)
	
	
func on_hurt() -> void:
	scale_component.tween_scale()
	shake_component.apply_random_shake()
	animation_player.play("flash")


func on_screen_exited() -> void:
	GameEvents.enemy_exited_screen.emit(hitbox_component.damage)
	queue_free()
	

func on_no_health() -> void:
	GameEvents.enemy_killed.emit(points)

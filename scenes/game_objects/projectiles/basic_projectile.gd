class_name Projectile
extends Node2D

@onready var scale_component: ScaleComponent = $ScaleComponent
@onready var hitbox_component: HitboxComponent = $HitboxComponent
@onready var visible_on_screen_notifier_2d: VisibleOnScreenNotifier2D = $VisibleOnScreenNotifier2D
@onready var move_component: MoveComponent = $MoveComponent


func _ready() -> void:
	scale_component.tween_scale()
	visible_on_screen_notifier_2d.screen_exited.connect(queue_free)

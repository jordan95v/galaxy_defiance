extends Node2D

@onready var visible_on_screen_notifier_2d: VisibleOnScreenNotifier2D = $VisibleOnScreenNotifier2D
@onready var health_component: HealthComponent = $HealthComponent
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var hurtbox_component: HurtboxComponent = $HurtboxComponent


func _ready() -> void:
	visible_on_screen_notifier_2d.screen_exited.connect(queue_free)
	health_component.no_health.connect(on_no_health)


func on_no_health() -> void:
	animated_sprite_2d.play("die")
	hurtbox_component.set_deferred("monitoring", false)
	await animated_sprite_2d.animation_finished
	queue_free()

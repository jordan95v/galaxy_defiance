extends Node

@export var hurtbox_component: HurtboxComponent
@export var animated_sprite: AnimatedSprite2D
const FLASH_MATERIAL: ShaderMaterial = preload(
	"res://scenes/game_objects/enemies/flash_material.tres"
)
var original_material: Material


func _ready() -> void:
	hurtbox_component.hurt.connect(on_hurt)
	original_material = animated_sprite.material


func on_hurt() -> void:
	var timer: Timer = Timer.new()
	add_child(timer)
	timer.wait_time = 0.2
	animated_sprite.material = FLASH_MATERIAL
	timer.start()
	await timer.timeout
	animated_sprite.material = original_material

class_name DestroyedComponent
extends Node

@export var actor: Node2D
@export var health_component: HealthComponent
@onready var spawn_component: SpawnComponent = $SpawnComponent


func _ready() -> void:
	health_component.no_health.connect(on_no_health)
	

func on_no_health() -> void:
	if not actor or not health_component:
		return
	spawn_component.spawn(actor.global_position)
	actor.queue_free()

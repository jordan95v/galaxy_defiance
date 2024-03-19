extends Node

@onready var spawn_component: SpawnComponent = $SpawnComponent
@export var actor: Node2D
@export var health_component: HealthComponent
@export var bonus_scenes: Array[PackedScene]
@export_range(0, 1) var pourcentage: float = 0.10


func _ready() -> void:
	health_component.no_health.connect(on_no_health)
	

func on_no_health() -> void:
	var bonus_layer: Node2D = get_tree().get_first_node_in_group("bonus_layer")
	if not bonus_layer:
		return
	var random_number: float = randf()
	if not actor or not health_component or bonus_scenes.is_empty() or pourcentage < random_number:
		return
	spawn_component.scene = bonus_scenes.pick_random()
	spawn_component.spawn(actor.global_position, bonus_layer)
		
	

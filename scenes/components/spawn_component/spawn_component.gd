class_name SpawnComponent
extends Node

@export var scene: PackedScene


func spawn(spawn_position: Vector2, parent: Node = get_tree().current_scene) -> void:
	if not scene:
		return
	var instance: Node2D = scene.instantiate()
	parent.add_child(instance)
	instance.global_position = spawn_position

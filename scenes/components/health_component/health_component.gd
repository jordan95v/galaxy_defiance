class_name HealthComponent
extends Node

signal no_health
signal health_changed(remaining_health: int)

@export var health: int = 5


func take_damage(value: int) -> void:
	health = max(health - value, 0)
	if health:
		return
	no_health.emit()
		
		

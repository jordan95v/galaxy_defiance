class_name HealthComponent
extends Node

signal no_health
@export var health: int = 5


func take_damage(value: int) -> void:
	health = max(health - value, 0)
	if health:
		return
	no_health.emit()
		
		

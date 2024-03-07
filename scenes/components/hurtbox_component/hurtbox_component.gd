class_name HurtboxComponent
extends Area2D

signal hurt
@export var health_component: HealthComponent


func _ready() -> void:
	area_entered.connect(on_area_entered)


func on_area_entered(other_area: Area2D) -> void:
	if not other_area is HitboxComponent or not health_component:
		return
	var area: HitboxComponent = other_area as HitboxComponent
	health_component.take_damage(area.damage)
	hurt.emit()
	if area.owner is Laser:
		area.owner.queue_free()
	

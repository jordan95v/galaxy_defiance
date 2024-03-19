class_name BasicBonus
extends Node2D

@onready var pickup_area: Area2D = $PickupArea
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@export var bonus_list: Array[Bonus]


func _ready() -> void:
	pickup_area.area_entered.connect(on_pickup_area_entered)
	

func on_pickup_area_entered(_area: Area2D) -> void:
	if bonus_list.is_empty():
		return
	var random_bonus: Bonus = bonus_list.pick_random()
	GameEvents.bonus_picked.emit(random_bonus)
	animation_player.play("pickup")
	

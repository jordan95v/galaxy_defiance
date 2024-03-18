extends CanvasLayer

@onready var h_box_container: HBoxContainer = %HBoxContainer
@export var player_icon_scene: PackedScene
@export var health_component: HealthComponent
@export var hurt_component: HurtboxComponent
	
	
func _ready() -> void:
	create_health_icons()
	hurt_component.hurt.connect(on_hurt)


func on_hurt() -> void:
	var player_icons: Array[Node] = h_box_container.get_children()
	if player_icons.is_empty():
		return
	player_icons[0].queue_free()
	

func create_health_icons() -> void:
	if not health_component:
		return
	for i in range(health_component.health):
		var instance: TextureRect = player_icon_scene.instantiate()
		h_box_container.add_child(instance)

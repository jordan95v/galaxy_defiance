extends Projectile

@onready var explode_timer: Timer = $ExplodeTimer
@export var exploding_projectile_scene: PackedScene


func _ready() -> void:
	super()
	explode_timer.timeout.connect(on_explode_timer_timeout)
	

func on_explode_timer_timeout() -> void:
	var projectiles_layer: Node2D = get_tree().get_first_node_in_group("projectiles")
	if not projectiles_layer or not exploding_projectile_scene:
		return
	for x in [-30,  30]:
		var instance: Projectile = exploding_projectile_scene.instantiate() as Projectile
		projectiles_layer.add_child(instance)
		instance.global_position = global_position
		instance.move_component.velocity.x = x
	queue_free()

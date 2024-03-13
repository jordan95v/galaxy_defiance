extends BasicEnemy


func _ready() -> void:
	super()
	move_component.velocity.x = [-10, 10].pick_random()

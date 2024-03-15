extends BasicEnemy

enum State {GOING_DOWN, GOING_SIDE}
var state: State = State.GOING_DOWN
@onready var state_timer: Timer = $StateTimer
@export var speed: int = 15


func _ready() -> void:
	super()
	state_timer.timeout.connect(on_state_timer_timeout)
	

func on_state_timer_timeout() -> void:
	if state == State.GOING_DOWN:
		move_component.velocity.y = 0
		move_component.velocity.x = [-speed, speed].pick_random()
		state = State.GOING_SIDE
	else:
		move_component.velocity.y = speed
		move_component.velocity.x = 0
		state = State.GOING_DOWN

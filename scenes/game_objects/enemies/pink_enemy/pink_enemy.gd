extends BasicEnemy

enum State {GOING_DOWN, GOING_SIDE}
var state: State = State.GOING_DOWN
@onready var state_timer: Timer = $StateTimer
@onready var fire_rate_timer: Timer = $FireRateTimer
@onready var spawn_component: SpawnComponent = $SpawnComponent
@onready var marker_2d: Marker2D = $Marker2D
@export var speed: int = 10

@export var projectiles: Array[PackedScene]


func _ready() -> void:
	super()
	spawn_component.scene = projectiles.pick_random()
	state_timer.timeout.connect(on_state_timer_timeout)
	fire_rate_timer.timeout.connect(on_fire_rate_timer_timeout)
	

func on_fire_rate_timer_timeout() -> void:
	spawn_component.spawn(marker_2d.global_position)
	

func on_state_timer_timeout() -> void:
	if state == State.GOING_DOWN:
		move_component.velocity.y = 0
		move_component.velocity.x = [-speed, speed].pick_random()
		state = State.GOING_SIDE
	else:
		move_component.velocity.y = speed
		move_component.velocity.x = 0
		state = State.GOING_DOWN

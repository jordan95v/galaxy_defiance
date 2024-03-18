extends ParallaxBackground

@onready var big_planet: ParallaxLayer = $BigPlanet
@onready var ring_planet: ParallaxLayer = $RingPlanet
@onready var far_planets: ParallaxLayer = $FarPlanets
@onready var stars: ParallaxLayer = $Stars
@onready var timer: Timer = $Timer
var speed: int = 20
@export var acceleration: int = 10


func _ready() -> void:
	timer.timeout.connect(on_timer_timeout)


func _process(delta: float) -> void:
	stars.motion_offset.y += speed * 0.80 * delta
	far_planets.motion_offset.y += speed * 0.60 * delta
	ring_planet.motion_offset.y += speed * 0.30 * delta
	big_planet.motion_offset.y += speed * 0.10 * delta	
	
	
func on_timer_timeout() -> void:
	speed = clamp(speed + acceleration, speed, speed * 20)

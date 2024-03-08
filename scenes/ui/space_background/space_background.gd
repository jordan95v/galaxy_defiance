extends ParallaxBackground

@onready var big_planet: ParallaxLayer = $BigPlanet
@onready var ring_planet: ParallaxLayer = $RingPlanet
@onready var far_planets: ParallaxLayer = $FarPlanets
@onready var stars: ParallaxLayer = $Stars

func _process(delta: float) -> void:
	stars.motion_offset.y += 20 * delta
	far_planets.motion_offset.y += 15 * delta
	ring_planet.motion_offset.y += 6 * delta
	big_planet.motion_offset.y += 4 * delta
	

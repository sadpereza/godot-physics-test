extends Node

func _physics_process(_delta):
	var vel_vs_planet = $Ship.get_position() - $Planet.get_position()
	$CanvasLayer/Label.set_text("x:{x}\ny{y}".format({
		"x":vel_vs_planet.x,
		"y":vel_vs_planet.y
	}))

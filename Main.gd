extends Node

func _physics_process(_delta):
	var vel_vs_planet = $Ship.get_position() - $Planet.get_position()
	$CanvasLayer/Label.set_text("x:{x}\ny{y}".format({
		"x":vel_vs_planet.x,
		"y":vel_vs_planet.y
	}))

onready var bg = $ParallaxBackground/ParallaxLayer

func _on_Ship_zoom_in(factor):
	bg.get_node("TextureRect").rect_size *= factor
	pass


func _on_Ship_zoom_out(factor):	
	bg.get_node("TextureRect").rect_size *= 1/factor
	#bg.get_node("Sprite").scale *= 1/factor
	#bg.motion_mirroring *= factor
	pass


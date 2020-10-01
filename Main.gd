extends Node

func _process(_delta):
	$Label.text = "x: " + str($Ship.position.x) + "\ny: " + str($Ship.position.y)

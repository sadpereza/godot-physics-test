extends Node2D



func _on_Sphere_Of_Influence_body_entered(body: Node):
	print(str(body.name) + " just entered.")

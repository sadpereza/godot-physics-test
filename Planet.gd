extends RigidBody2D

func _ready():
	$SphereOfInfluence.set_gravity_distance_scale(0.003)
	set_mass(500)

func _on_Sphere_Of_Influence_body_entered(body: Node):
	print("{body_name} just entered. Gravity falloff at {falloff}".format({
		"body_name":body.get_name(), 
		"falloff":$SphereOfInfluence.get_gravity_distance_scale()
		}
	))


func _on_Button_pressed():
	$SphereOfInfluence.set_gravity_distance_scale(\
		$SphereOfInfluence.get_gravity_distance_scale() * 2)
	$Label.set_text(str($SphereOfInfluence.get_gravity_distance_scale()))


func _on_Button2_pressed():
	$SphereOfInfluence.set_gravity_distance_scale(\
		$SphereOfInfluence.get_gravity_distance_scale() / 2)
	$Label.set_text(str($SphereOfInfluence.get_gravity_distance_scale()))

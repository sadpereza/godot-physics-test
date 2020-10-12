extends RigidBody2D

var velocity
export var acceleration = 1.0
export var rotation_speed = 0.25

var trail_particle = preload("res://Trail Particle.tscn")

onready var zoom_factor = 16.0/15.0 # amount $Camera2D.zoom is multiplied by to zoom in
signal zoom_change(factor)

func _physics_process(_delta):
	if Input.is_action_pressed("ui_left"):
		linear_velocity += Vector2(\
		cos((rotation_degrees - 90) * PI / 180) * acceleration,
		sin((rotation_degrees - 90) * PI / 180) * acceleration)
	if Input.is_action_pressed("ui_right"):
		linear_velocity += Vector2(\
		cos((rotation_degrees + 90) * PI / 180) * acceleration,
		sin((rotation_degrees + 90) * PI / 180) * acceleration)
	if Input.is_action_pressed("ui_up"):
		linear_velocity += Vector2(\
		cos(rotation_degrees * PI / 180) * acceleration * 4,
		sin(rotation_degrees * PI / 180) * acceleration * 4)
	if Input.is_action_pressed("ui_down"):
		linear_velocity -= Vector2(\
		cos(rotation_degrees * PI / 180) * acceleration,
		sin(rotation_degrees * PI / 180) * acceleration)
	if Input.is_action_pressed("ui_select"):
		if linear_velocity.length() > acceleration * 2:
			linear_velocity.x -= linear_velocity.normalized().x * acceleration * 4
			linear_velocity.y -= linear_velocity.normalized().y * acceleration * 4
			# horrible, horrible, code
		else:
			linear_velocity.x = 0
			linear_velocity.y = 0
	if Input.is_action_pressed("ui_focus_next"):
		if angular_velocity > rotation_speed* 5:
			angular_velocity -= rotation_speed * 5
		elif angular_velocity < -rotation_speed * 5:
			angular_velocity += rotation_speed * 5
		else:
			angular_velocity = 0
	
	if Input.is_action_pressed("ui_tab_left"):
		angular_velocity -= rotation_speed
	elif Input.is_action_pressed("ui_tab_right"):
		angular_velocity += rotation_speed
	
	if Input.is_action_pressed("ui_cancel"):
		# warning-ignore:return_value_discarded
		get_tree().reload_current_scene()
		
	if Input.is_action_just_released("zoom_in"):
		$Camera2D.zoom = $Camera2D.zoom * zoom_factor
		emit_signal("zoom_change", zoom_factor)
	if Input.is_action_just_released("zoom_out"):
		$Camera2D.zoom = $Camera2D.zoom * 1.0/zoom_factor
		emit_signal("zoom_change", 1.0/zoom_factor)


func _on_Trail_Particle_Timer_timeout():
	var p = trail_particle.instance()
	var stage = get_parent()
	if stage:
		stage.add_child(p)
		p.position = position
	else:
		print("No stage found for particle!")
	
	#print("PARTICLE")

extends "res://tanks/Tank.gd"

func control(delta):
	# let the turret rotate in direction of the mouse position with look_at
	$Turret.look_at(get_global_mouse_position())
	var rot_dir = 0
	# let the body rotate if A or D is pressed
	if Input.is_action_pressed("turn_right"):
		rot_dir += 1
	if Input.is_action_pressed("turn_left"):
		rot_dir -= 1
	rotation += rotation_speed * rot_dir * delta

	# forward (W) and backward (S) in direction the body is pointing to
	
	velocity = Vector2()
	# driving forward in the direction the tank is pointing to with 
	if Input.is_action_pressed("forward"):
		velocity = Vector2(max_speed, 0).rotated(rotation)
	# driving backward 
	if Input.is_action_pressed("back"):
		# driving backward is two times slower, going backward in the direction
		# tank is pointing to
		velocity = Vector2(-max_speed/2, 0).rotated(rotation)	
	if Input.is_action_just_pressed("click"):
		shoot()
		
		

func _on_GunTimer_timeout():
	can_shoot = true
	


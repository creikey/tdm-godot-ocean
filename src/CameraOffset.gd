extends Spatial

func _input(event):
	if Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED and event is InputEventMouseMotion:
		var rel: Vector2 = event.relative * 0.005
		rotation.y -= rel.x
		$Camera.rotation.x -= rel.y
		$Camera.rotation.x = clamp($Camera.rotation.x, -PI/2.0, PI/2.0)
	elif event is InputEventMouseButton and event.is_pressed():
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	elif event.is_action_pressed("escape"):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

func _process(delta):
	var movement: Vector2 = Vector2(
		Input.get_action_strength("right") - Input.get_action_strength("left"),
		Input.get_action_strength("backward") - Input.get_action_strength("forward")
	)
	
	var speed: float = 20.0
	
	if Input.is_action_pressed("sprint"):
		speed = 90.0
	
	global_transform.origin += $Camera.global_transform.basis.z * movement.y * delta * speed
	global_transform.origin += $Camera.global_transform.basis.x * movement.x * delta * speed
	global_transform.origin.y += (Input.get_action_strength("up") - Input.get_action_strength("down")) * delta * speed
	global_transform.origin.y = clamp(global_transform.origin.y, -5.0, 40.0)

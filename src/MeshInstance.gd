extends MeshInstance

var t: float = 0.0

func _process(delta):
	t += delta
	rotation.x = cos(t*2.0 + sin(t))*0.1
	rotation.z = sin(t*0.3 + cos(t*0.7 + 0.3))*0.09
	translation.y = sin(t)*0.5

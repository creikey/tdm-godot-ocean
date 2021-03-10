extends Spatial

export (NodePath) var camera_path

onready var camera: Spatial = get_node(camera_path)

var plane_offset := Vector3()

func _ready():
	plane_offset = global_transform.origin - camera.global_transform.origin

func _process(_delta):
	var target: Vector3 = camera.global_transform.origin
	global_transform.origin = Vector3(target.x, 0, target.z) + plane_offset
	rotation.y = camera.rotation.y

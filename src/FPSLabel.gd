extends Label

func _process(_delta):
	text = str("FPS: ", Engine.get_frames_per_second())

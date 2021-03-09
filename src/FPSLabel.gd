extends Label

func _process(delta):
	text = str("FPS: ", Engine.get_frames_per_second())

extends Sprite2D

func _process(delta: float) -> void:
	# Get the current mouse position
	var mouse_pos = get_global_mouse_position()
	
	# Set the position of the tile to the mouse position
	position = mouse_pos
	
	# Round the position to the nearest multiple of 16
	position.x = round((position.x - 8) / 16.0) * 16.0 + 8
	position.y = round((position.y - 8) / 16.0) * 16.0 + 8

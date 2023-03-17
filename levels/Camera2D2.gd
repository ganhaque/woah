extends Camera2D

@onready var player_cat = get_node("/root/GameLevel/playerCat")

# https://godotengine.org/qa/95641/move-camera-to-mouse
# determine how fast the camera moves towards the target location
# aka the middle point between the cursor and player
var interpolate_val = 1.6
var max_distance = 200

func _physics_process(delta):
	var target = player_cat.global_position 
	var mouse_position = get_global_mouse_position()
	
	var distance_to_mouse = target.distance_to(mouse_position)
	
	# Limit the maximum distance between the player and mouse cursor
	if distance_to_mouse > max_distance:
		mouse_position = target.lerp(mouse_position, max_distance / distance_to_mouse)
	
	var mid_x = (target.x + mouse_position.x) / 2
	var mid_y = (target.y + mouse_position.y) / 2

#	if (mid_x <= target.x):
	global_position = global_position.lerp(
		Vector2(mid_x,mid_y), interpolate_val * delta
		)

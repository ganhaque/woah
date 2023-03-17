extends Camera2D

const MAX_CAMERA_DISTANCE := 50.0
const MAX_CAMERA_PERCENT := 0.1
const CAMERA_SPEED := 1000.0
const MINIMUM_RADIUS = 10.0

# var playerCat = $playerCat
@onready var player_cat = get_node("/root/GameLevel/playerCat")
var distance_to_player_cat = global_position.distance_to(player_cat.global_position)

var spd = 10
var radius_required_to_move = 10.0
var max_distance = 50 # maximum distance between camera and playerCat

func _process(delta):

	# print(player_cat)
	var catPosition = player_cat.global_position
	print(catPosition)
	var mouse_position = get_global_mouse_position()
	var center_coordinate = get_target_position()
#	distance_to_player_cat = global_position.distance_to(player_cat.global_position)
	distance_to_player_cat = center_coordinate.distance_to(catPosition)
	# print (distance_to_player_cat)
	# print(mouse_position)
	var mouse_delta = mouse_position - global_position
	# print(mouse_delta)
	# print(MINIMUM_RADIUS)
	
	var camera_distane_to_player = position.distance_to(player_cat.global_position)

	# position += catPosition
	
	if (mouse_delta.length() >= MINIMUM_RADIUS and (distance_to_player_cat <= MAX_CAMERA_DISTANCE)):
		print("proc")
		position = catPosition
		# position = position.linear_interpolate(player_cat.global_position, mouse_delta * camera_distane_to_player)
		position += (mouse_delta / MINIMUM_RADIUS) * CAMERA_SPEED * delta
#		self.position += (mouse_delta / 1) * 1000 * delta
		print(position)
		
#	if (mouse_delta.length() >= radius_required_to_move):



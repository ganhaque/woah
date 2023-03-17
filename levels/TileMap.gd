extends TileMap

@onready var highlight_tile = get_parent().get_node("HighlightTile")

# Called when the node enters the scene tree for the first time.
func _ready():
	print(highlight_tile)
	print(highlight_tile.position)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):

	var highlight_pos = highlight_tile.position
	
	# get the cell position of the highlight tile
	var cell_pos = local_to_map(highlight_pos)
	
	# get the tile ID of the tile at the cell position
	var tile_id = get_cell_source_id(1, cell_pos)
	
	# get the custom data for the tile at the cell position
	var custom_data = get_cell_tile_data(1, cell_pos)  # replace 1 with the index of your custom data layer
	
	if (custom_data != null):
		var isFlower = custom_data.get_custom_data("flower")
		print(isFlower)
	# if the tile ID is valid (not -1), print the custom data
	print("Custom data:", custom_data)
	if tile_id != -1:
		print("Tile ID:", tile_id)
		print("Custom data:", custom_data)

func get_current_tile(layer, coordinate):
	var tile_data := get_cell_tile_data(0, coordinate)
	var test_data = tile_data.get_custom_data("flower")
	print(test_data)


extends TileMapLayer
@onready var not_passable: TileMapLayer = $not_passable


# Called when the node enters the scene tree for the first time.
func toggle_map(toggle:bool):
	enabled = toggle
	not_passable.enabled = toggle

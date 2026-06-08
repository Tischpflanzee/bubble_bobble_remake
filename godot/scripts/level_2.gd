extends TileMapLayer

@onready var not_passable: TileMapLayer = $not_passable


func toggle_map(toggle:bool):
	enabled = toggle
	not_passable.enabled = toggle

extends TileMapLayer

@onready var not_passable: TileMapLayer = $not_passable
@onready var inner_walls: TileMapLayer = $inner_walls


func toggle_map(toggle:bool):
	enabled = toggle
	not_passable.enabled = toggle
	inner_walls.enabled = toggle

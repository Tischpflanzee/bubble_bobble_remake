extends Node

var enemies_killed:int
var score:int = 0
var parent = get_parent()


# Called when the node enters the scene tree for the first time.
func game_end():
	var game_over = get_parent().get_node("Node2D").get_node("game_over_sprite")
	game_over.set_visiblity(true)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	change_level()

func enemies_killed_add(): 
	enemies_killed += 1

func score_add(value):
	score += value

func change_level():
	var parent = get_parent()
	var node2d = parent.get_node("Node2D")
	var level_1 = node2d.get_node("level_1")
	if enemies_killed == 3:
		level_1.disable_map()

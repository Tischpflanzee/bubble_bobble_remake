extends Node

var enemies_killed:int
var parent = get_parent()




# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print_()
	pass # Replace with function body.

func enemies_killed_add(): 
	enemies_killed += 1

func print_():
	var parent = get_parent()
	print(parent)
	print(parent.get_children())

	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if enemies_killed == 1:
		pass

	pass

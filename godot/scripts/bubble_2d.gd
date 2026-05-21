extends Area2D



#@onready var oben = $oben
@onready var rechts = $rechts
#@onready var links = $links
#@onready var unten = $unten

@onready var float_time: Timer = $float_time
#@onready var Player  = $Player#/texture 





 



var on_float_timeout = false
var counter = 0
var direction_right = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	float_time.start()
	
	var parent = get_parent()
	var player = parent.get_node("Player")
	direction_right = player.is_right()
	
	
	
	
	
#	print($Node2D/Player.is_right())
	
	
	
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
		
	
	if rechts.is_colliding():
		position.x -= 1
	

	pass

		
func move(length) -> void:
	var add = -1
	if direction_right == true: 
		add = 1
	
	if counter != length:
			position.x += add
			counter += 1
	elif counter == length:
		pop()
		float_time.stop()
		
func _on_float_time_timeout() -> void:
	var length = 50
	
	move(length)
	pass # Replace with function body.

func pop() -> void:
	
	get_parent().remove_child(self)
	
	print("poped")
	float_time.stop()
	pass

extends Area2D



#@onready var oben = $oben
@onready var rechts = $rechts
#@onready var links = $links
#@onready var unten = $unten

#@onready var path_2d: Path2D = $Path2D
#@onready var path_follow: PathFollow2D = $Path2D/PathFollow2D
@onready var float_time: Timer = $float_time






var on_float_timeout = false
var counter = 0
var direction_right = false
var moving = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	float_time.start()
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("move_right"):
		if moving == false:
			direction_right = true
			print("right")
			print(direction_right)
		
	
	if Input.is_action_pressed("move_left"):
		if moving == false:
			direction_right = false 
			print("left")
			print(direction_right)
		
	
	if rechts.is_colliding():
		position.x -= 1
	

	pass

func move_right(length) -> void:
	moving = true
	if counter != length:
		position.x += 1
		counter += 1
	elif counter == 100:
		pop()
		float_time.stop()
		
func move_left(length) -> void:
	moving = true
	if counter != length:
			position.x -= 1
			counter += 1
	elif counter == 100:
		pop()
		float_time.stop()
		
func _on_float_time_timeout() -> void:
	var length = 500
	
	if direction_right == true:
		move_right(length)
	elif direction_right == false:
		move_left(length)
	
	pass # Replace with function body.

func pop() -> void:
	print("poped")
	float_time.stop()
	pass

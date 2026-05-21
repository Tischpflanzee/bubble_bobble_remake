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

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	float_time.start()
	
		

	pass # Replace with function body.
	
	
#func _physics_process(delta: float) -> void:
#	position = path_follow.global_position
#	pass
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if rechts.is_colliding():
		position.x -= 0.5 
	

	pass


func _on_float_time_timeout() -> void:
	
	#on_float_timeout = true
	print("timeout!")
	
	if counter != 100:
		position.x += (0.25 + 0.25)
		counter += 1
	
		
	
	
	pass # Replace with function body.

extends CharacterBody2D


const SPEED = 1.0
const JUMP_VELOCITY = -400.0




var richtung = -1
var parent = get_parent().Player.is_right()
#var player = parent.Player
	


func _ready() -> void:
	print(parent)
	pass

func _process(delta: float) -> void:
	#var is_right = player.is_right()
	
	#if is_right == true:
	#	richtung = -1
	
	pass

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta 

	# Handle jump.


	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	

	
	

	move_and_slide()
	
	

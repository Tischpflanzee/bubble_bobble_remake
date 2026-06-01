extends CharacterBody2D


const SPEED = 50.0
const JUMP_VELOCITY = -100.0

@onready var _animated_sprite = $texture
@onready var check_up = $RayCast2D
@onready var timer: Timer = $cooldown

signal create_bubble
signal left
signal right
#signal hit_celing

var cooldown = false

func is_right() -> bool:
	var result = _animated_sprite.flip_h
	return result
	pass 
	



func _process(_delta):
	if Input.is_action_pressed("move_right") and not Input.is_action_pressed("move_left"):
		_animated_sprite.flip_h = true
		emit_signal("right")
		_animated_sprite.play("walk")
	elif Input.is_action_pressed("move_left") and not Input.is_action_pressed("move_right"):
		_animated_sprite.flip_h = false
		emit_signal("left")
		
		_animated_sprite.play("walk")
	else:
		_animated_sprite.stop()
	
	if velocity.y < 0 :
		set_collision_mask_value(1,false)
	else :
		set_collision_mask_value(1,true)
		
	if Input.is_action_pressed("create_bubble"):
		 
		if cooldown == false:
			cooldown = true
			timer.start()
			emit_signal("create_bubble")
	
	#if  !is_on_floor() and check_up.is_colliding()  :
	#	print("Collided!")a
	#	#hit_celing.emit()
	#	set_collision_mask_value(1,false)
	#else: 
	#	set_collision_mask_value(1,true)
		
		
	

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta / 8

	# Handle jump.
	if Input.is_action_just_pressed("move_up") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()


func _on_cooldown_timeout() -> void:
	cooldown = false
	pass # Replace with function body.

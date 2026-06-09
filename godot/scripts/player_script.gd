extends CharacterBody2D


const SPEED = 50.0
const JUMP_VELOCITY = -100.0

@onready var _animated_sprite = $texture
@onready var check_up = $RayCast2D
@onready var timer: Timer = $cooldown
@onready var death_time: Timer = $death_time
@onready var invincibility_time: Timer = $invincibility_time
@onready var player_start_pos: Marker2D = $"../Player_Start_Pos"


signal create_bubble
signal left
signal right
#signal hit_celing

var cooldown = false
var health:int 
var alive:bool = true

func _ready() -> void:
	_animated_sprite.play("walk")
	

func on_game_end():
	alive = false
	death_time.stop()

func is_right() -> bool:
	var result = _animated_sprite.flip_h
	return result


func _process(_delta):
	animations()
	handle_collision_deactivating_when_jumping()
	handle_bubble_input()
		

	

		
		
	

func _physics_process(delta: float) -> void:
	if alive == false:
		return
	
	
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta / 8

	# Handle jump.
	if Input.is_action_just_pressed("move_up") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	var direction := Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

func animations() -> void:
	if alive == false:
		return
	
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
	pass

func handle_collision_deactivating_when_jumping(): 
	if velocity.y < 0 :
		set_collision_mask_value(4,false)
	else :
		set_collision_mask_value(4,true)
		
func handle_bubble_input():
	if alive == false:
		return
	
	if Input.is_action_pressed("create_bubble"):
		if cooldown == false:
			cooldown = true
			timer.start()
			emit_signal("create_bubble")
			
	

func _on_cooldown_timeout() -> void: 
	cooldown = false
	pass # Replace with function body.
	
func set_health(value) -> void:
	health = value

func get_health() -> int:
	return health


func _on_area_2d_body_entered(body: Node2D) -> void: # Health Mangementd
	var invincibility_time_left:int = invincibility_time.time_left
	if invincibility_time_left != 0:
		return
	
	if body.is_in_group("Enemie"):
		health -= 1
		alive = false
		death_animation()
		print("Health: ", health)
		invincibility_time.start()
		
func _on_area_2d_area_shape_entered(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	var invincibility_time_left:int = invincibility_time.time_left
	if invincibility_time_left != 0:
		return
	if !area.is_in_group("Enemie"):
		return
	
	health -= 1
	alive = false
	death_animation()
	print("Health: ", health)
	invincibility_time.start()
		


func death_animation():
	_animated_sprite.play("death")
	death_time.start()

func _on_death_time_timeout() -> void:
	alive = true

func next_level():
	self.position = player_start_pos.position

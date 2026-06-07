extends CharacterBody2D


const SPEED = 50.0
const JUMP_VELOCITY = -100.0


@onready var wall_collsion = $Wall_check
@onready var sprite = $AnimatedSprite2D
@onready var jump_cooldown: Timer = $jump_cooldown
@onready var check_floor: RayCast2D = $check_floor
@onready var timer: Timer = $check_floor/Timer


var richtung = -1
var cooldown:bool
var time_left


func in_bubble():
	pass


func _ready() -> void:
	timer.start()
	jump_cooldown.start()
	pass

func _process(delta: float) -> void:
	flip()
	animations()
	jump_over_hole()
	handle_collision_deactivating_when_jumping()

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta / 8

	var parent = get_parent()
	var player = parent.get_node("Player")
	
	if is_on_floor():
		velocity.x = SPEED * richtung
	elif velocity.y < 0 and player.position.y > self.position.y - JUMP_VELOCITY:
		velocity.x = 0
	move_and_slide()

func flip() -> void:
	time_left = timer.time_left
	if time_left != 0: #fixed the problem that zen_chan got stuch on the wall 
		return
	
	
	if wall_collsion.is_colliding() == true: 
		richtung *= -1
		sprite.flip_h = !sprite.flip_h
		wall_collsion.target_position.x *= -1
		check_floor.position.x *= -1
	timer.start()

func animations() -> void:
	$AnimatedSprite2D.play("walk")

func jump_over_hole() -> void:
	if check_floor.is_colliding():
		return
	if !is_on_floor():
		return
	var parent = get_parent()
	var player = parent.get_node("Player")#
	var player_position:int = player.position.y #chaning to because values are difrent when not an Int
	var zen_chan_position:int = self.position.y #chaning to because values are difrent when not an Int
	if player_position <= zen_chan_position:
		velocity.y = JUMP_VELOCITY / 2 


func _on_jump_cooldown_timeout() -> void: # handle jump
	
	var parent = get_parent()
	var player = parent.get_node("Player")
	
	if player.position.y < self.position.y - 20 and is_on_floor() and self.position.y > -136:
		velocity.y = JUMP_VELOCITY 
		

func handle_collision_deactivating_when_jumping():  
	if velocity.y < 0 :
		set_collision_mask_value(4,false)
	else :
		set_collision_mask_value(4,true)
	

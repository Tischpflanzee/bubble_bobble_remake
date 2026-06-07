extends CharacterBody2D


const SPEED = 50.0
const JUMP_VELOCITY = -100.0


@onready var wall_collsion = $Wall_check
@onready var sprite = $AnimatedSprite2D
@onready var jump_cooldown: Timer = $jump_cooldown
@onready var check_floor: RayCast2D = $check_floor
@onready var timer: Timer = $check_floor/Timer
@onready var check_celling: RayCast2D = $check_celling


var richtung = -1
var cooldown:bool
var check_jump:bool = false
var time_left

func in_bubble():
	pass

func fliped(toggle:bool):
	var sprite = $AnimatedSprite2D  # needed when just spawned
	var wall_collsion = $Wall_check
	var check_floor: RayCast2D = $check_floor
	if toggle == true:
		richtung *= -1
		sprite.flip_h = true
		wall_collsion.target_position.x *= -1
		check_floor.position.x *= -1

func _ready() -> void:
	timer.start()
	jump_cooldown.start()
	pass

func _process(delta: float) -> void:
	flip()
	animations()
	jump_over_hole()
	handle_collision_deactivating_when_jumping()
	if check_jump == true:
		jump()

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta / 8

	var parent = get_parent()
	var player = parent.get_node("Player")
	
	if check_jump == true:
		velocity.x = 0
		move_and_slide()
		return
	
	if is_on_floor():
		velocity.x = SPEED * richtung
	elif velocity.y > 0 and player.position.y > self.position.y - (JUMP_VELOCITY / 2 ):
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
	if check_celling.is_colliding() == false:
		return
	var parent = get_parent()
	var player = parent.get_node("Player")
	if player.position.y > self.position.y - 20:
		return  
	
	var player_pos:int = player.position.y
	var self_pos:int = self.position.y
	if self_pos == player_pos:
		return

	
	if  is_on_floor() :
		check_jump = true # enables to check if ablet to jump and the jump
		

func jump() -> void: 
	if !is_on_floor():
		return
	
	if check_celling.is_colliding() == false:
		velocity.y = 0
	if self.velocity.y < 0:
		pass
	var player_pos:int = get_parent().get_node("Player").position.y
	var self_pos:int = self.position.y
	
	if self_pos <= player_pos:
		check_jump = false
		return
	
	velocity.y = JUMP_VELOCITY 

func handle_collision_deactivating_when_jumping():  
	if velocity.y < 0 :
		set_collision_mask_value(4,false)
	else :
		set_collision_mask_value(4,true)
	

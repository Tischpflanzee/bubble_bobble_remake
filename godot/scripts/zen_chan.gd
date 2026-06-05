extends CharacterBody2D


const SPEED = 50.0
const JUMP_VELOCITY = -100.0




var richtung = -1
var cooldown:bool


@onready var wall_collsion = $Wall_check
@onready var sprite = $AnimatedSprite2D
@onready var jump_cooldown: Timer = $jump_cooldown
@onready var check_floor: RayCast2D = $check_floor


#var parent = get_parent()#.Player.is_right()
#var player = parent.Player
	
func in_bubble():
	
	pass


func _ready() -> void:
	jump_cooldown.start()
	pass

func _process(delta: float) -> void:
	flip()
	animations()
	jump_over_hole()
	handle_collision_deactivating_when_jumping()
	
	
	
	
	#var is_right = player.is_right()
	
	#if is_right == true:
	#	richtung = -1
	
	pass

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
	if wall_collsion.is_colliding() == true: 
		richtung *= -1
		sprite.flip_h = !sprite.flip_h
		wall_collsion.target_position.x *= -1
		check_floor.position.x *= -1
	pass

func animations() -> void:
	$AnimatedSprite2D.play("walk")
	pass

func jump_over_hole() -> void:
	var parent = get_parent()
	var player = parent.get_node("Player")#
	var player_position:int = player.position.y #chaning to because values are difrent when not an Int
	var zen_chan_position:int = self.position.y #chaning to because values are difrent when not an Int
	
	
	if !check_floor.is_colliding() and is_on_floor() and player_position < zen_chan_position - 20 or !check_floor.is_colliding() and is_on_floor() and player_position == zen_chan_position:
		velocity.y = JUMP_VELOCITY / 2 
		

	pass


	


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
	

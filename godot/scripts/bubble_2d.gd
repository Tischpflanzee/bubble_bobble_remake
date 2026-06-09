extends Area2D



#@onready var oben = $oben
@onready var rechts = $rechts
@onready var links = $links
@onready var collisionShape = $CollisionShape2D

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

func bubbeld():
	pass



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#enemie_collisions()
	manage_wall_collision() 
	bubbeld()
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
	queue_free()
	print("poped")
	float_time.stop()
	pass

func manage_wall_collision():
	if rechts.is_colliding():
		position.x -= 1
	if links.is_colliding():
		position.x += 1



func enemie_collisions():
	return
	var colider_r = rechts.get_collider()
	var colider_l = links.get_collider()
	
	if rechts.is_colliding() and colider_r.is_in_group("Enemie"):
		colider_r.queue_free()
		pop()
		GameState.score_add(500)
		GameState.enemies_killed_add()
	if links.is_colliding() and colider_l.is_in_group("Enemie"):
		colider_l.queue_free()
		pop()
		GameState.score_add(500)
		GameState.enemies_killed_add()
	


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("Enemie"):
		body.queue_free()
		GameState.score_add(500)
		GameState.enemies_killed_add()
		pop()
	if body.is_in_group("bub_k"):
		pop()
	


func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("Enemie"):
		area.queue_free()
		GameState.score_add(500)
		GameState.enemies_killed_add()
		pop()
	if area.is_in_group("bub_k"):
		pop()	

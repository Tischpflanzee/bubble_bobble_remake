extends Node2D

var scene = preload("res://scenes/bubble_2d.tscn")
var cooldown = true
var direction = "left"
@onready var player = $Player
@onready var enemie_spawn_point = $enemie_spawn_point







# Called when the node enters the scene tree for the first time.
func _ready() -> void:	
	spwan_enemie()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	pass

func spwan_enemie():
	var enemie_scene = preload("res://scenes/zen_chan.tscn")
	var enemie = enemie_scene.instantiate()
	enemie.position = enemie_spawn_point.position
	add_child(enemie)
	
	

func _on_character_body_2d_create_bubble() -> void:
	#Creates the bubbles
	var bubble = scene.instantiate()
	bubble.position = player.position 
	
	if direction == "right":
		bubble.position.x = player.position.x +15
	elif direction == "left":
		bubble.position.x = player.position.x -15
	add_child(bubble)
	
	cooldown = true
	pass # Replace with function body.


func _on_coldown_timeout() -> void:
	cooldown = false
	pass # Replace with function body.


func _on_player_left() -> void:
	direction = "left"	
	pass # Replace with function body.


func _on_player_right() -> void:
	direction = "right"
	pass # Replace with function body.


func _on_timer_timeout() -> void:
	#print(get_children())
#	bubble.position.x +=  +18
	pass # Replace with function body.

extends Node2D

var scene = preload("res://scenes/bubble_2d.tscn")
var cooldown = true
var direction = "left"
@onready var player = $Player




# Called when the node enters the scene tree for the first time.
func _ready() -> void:	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_character_body_2d_create_bubble() -> void:
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

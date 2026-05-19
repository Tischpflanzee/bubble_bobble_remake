extends RigidBody2D

@onready var timer = $float_time

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	timer.start()
	constant_force.x = 0.2
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	#position.x += 10
	#var velocity = Vector2.ZERO
	#velocity.x += 100
	#print("Moved!")
	pass


func _on_float_time_timeout() -> void:
	constant_force.x = 0
	pass # Replace with function body.

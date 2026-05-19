extends Area2D

#@onready var oben = $oben
@onready var rechts = $rechts
#@onready var links = $links
#@onready var unten = $unten


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if rechts.is_colliding():
		position.x -= 0.5 


	pass

extends Area2D

@onready var timer: Timer = $Timer

var richtung:int = 1

func _ready() -> void:
	timer.start()


func flip():
	richtung *= -1 

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	self.position.x += richtung
	if timer.time_left == 0.0:
		queue_free()
	pass

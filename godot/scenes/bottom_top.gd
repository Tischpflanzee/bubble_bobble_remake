extends Area2D
@onready var timer: Timer = $Timer
func _ready() -> void:
	timer.start()
	
func _on_body_entered(body: Node2D) -> void:
		body.teleported()

		body.position.y = -225.0
		print("moved")	

func _on_area_entered(area: Area2D) -> void:
		area.teleported()
		area.position.y = -225.0
		print("moved")	

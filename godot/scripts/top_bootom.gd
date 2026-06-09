extends Area2D

func _on_body_entered(body: Node2D) -> void:
	body.position.y = -226.0
	print("moved")	
	pass # Replace with function body.

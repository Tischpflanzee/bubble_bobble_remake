extends Area2D

@onready var oben: RayCast2D = $Oben
@onready var rechts: RayCast2D = $Rechts
@onready var links: RayCast2D = $Links
@onready var unten: RayCast2D = $Unten


const SPEED = 1
var richtung_y = 1
var richtung_x = 1


func _process(delta: float) -> void:
	self.position.x -= SPEED * richtung_x
	self.position.y -= SPEED * richtung_y
	
	if rechts.is_colliding():
		richtung_x = 1
		$AmimatedSprite2D.flip_h = false
	if links.is_colliding():
		richtung_x = -1
		$AmimatedSprite2D.flip_h = true
	if oben.is_colliding():
		richtung_y = -1
	if unten.is_colliding():
		richtung_y = 1
		

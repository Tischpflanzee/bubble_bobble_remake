extends Area2D

@onready var oben: RayCast2D = $Oben
@onready var rechts: RayCast2D = $Rechts
@onready var links: RayCast2D = $Links
@onready var unten: RayCast2D = $Unten
@onready var teleport_time: Timer = $teleport_time


const SPEED = 0.5
var richtung_y = 1
var richtung_x = 1

func _ready() -> void:
	$AmimatedSprite2D.play("default")

func teleported():
	set_collision_mask_value(6,false)
	teleport_time.start()
	pass
	

func _on_teleport_time_timeout() -> void:
	set_collision_mask_value(6,true)
	pass # Replace with function body.

func fliped(toggle:bool):
	if toggle == true:
		richtung_x = -1 
		$AmimatedSprite2D.flip_h = true

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
		

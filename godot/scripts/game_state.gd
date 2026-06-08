extends Node

var enemies_killed:int
var enemies_killed_needed:int = 3
var score:int = 0
var parent = get_parent()
var courent_level:int = 1



func _ready() -> void:
	game_start()

func game_start():
	var player = get_parent().get_node("Node2D").get_node("Player")
	player.set_health(3)
	

func game_end():
	var player = get_parent().get_node("Node2D").get_node("Player")
	if player.get_health() > 0:
		return
	
	player.on_game_end()
	
	var game_over = get_parent().get_node("Node2D").get_node("game_over_sprite")
	game_over.set_visiblity(true)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	change_levels()
	game_end()

func enemies_killed_add(): 
	enemies_killed += 1

func score_add(value):
	score += value
	
func next_level():
	var level_1 = get_parent().get_node("Node2D").get_node("level_1")
	var level_2 = get_parent().get_node("Node2D").get_node("level_2")
	var level_3 = get_parent().get_node("Node2D").get_node("level_3")
	var level_4 = get_parent().get_node("Node2D").get_node("level_4")
	var player = get_parent().get_node("Node2D").get_node("Player")
	var node2D = get_parent().get_node("Node2D")
	
	if courent_level == 3: #switch to 3
		player.next_level()
		level_3.toggle_map(false)
		level_4.toggle_map(true)
		player.next_level()
		enemies_killed = 0
		enemies_killed_needed = 6
		node2D.spwan_enemie(79.0,-57.0,true) #true = rechts
		node2D.spwan_enemie(167.0,-57.0,false) #true = rechts
		
		node2D.spwan_enemie(60.0,-140.0,true)
		node2D.spwan_enemie(185.0,-140.0,false)
		
		node2D.spwan_enemie(44.0,-173.0,true)
		node2D.spwan_enemie(203.0,-173.0,true)
		

	
	if courent_level == 2: #switch to 3
		player.next_level()
		level_2.toggle_map(false)
		level_3.toggle_map(true)
		player.next_level()
		enemies_killed = 0
		enemies_killed_needed = 4
		node2D.spwan_enemie(169.0,-181.0,false)
		node2D.spwan_enemie(86.0,-181.0,true)
		node2D.spwan_enemie(48.0,-100.0,true)
		node2D.spwan_enemie(205.0,-99.0,true)
		courent_level += 1
	
	if courent_level == 1: #switch to 2
		level_1.toggle_map(false)
		level_2.toggle_map(true)
		player.next_level()
		enemies_killed = 0 
		enemies_killed_needed = 4
		node2D.spwan_enemie(120.0,-177.0,false)
		node2D.spwan_enemie(141.0,-177.0,true)
		node2D.spwan_enemie(88.0,-137.0,false)
		node2D.spwan_enemie(165.0,-137.0,true)
		courent_level += 1
	

func change_levels():
	if enemies_killed == enemies_killed_needed:
		next_level()

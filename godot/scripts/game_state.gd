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
	player.set_health(5)
	

func game_end():
	var player = get_parent().get_node("Node2D").get_node("Player")
	if player.get_health() > 0:
		return
	
	player.on_game_end()
	
	var game_over = get_parent().get_node("Node2D").get_node("game_over_sprite")
	game_over.set_visiblity(true)

func score_set():
	high_score_set()
	lives_set()
func high_score_set():
	var highscore:Label = get_parent().get_node("Node2D").get_node("Control").get_node("Highscore")
	var score_string:String = str(score)
	highscore.text = "Score:\n" +  score_string 
func lives_set():
	
	var lives:Label = get_parent().get_node("Node2D").get_node("Control").get_node("Lives")
	var player = get_parent().get_node("Node2D").get_node("Player")
	var lives_string_bub:String = str(player.get_health())
	
	if player.get_health() >= 0:
		lives.text = "Life: " + lives_string_bub
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	change_levels()
	game_end()
	score_set()

func enemies_killed_add(): 
	enemies_killed += 1

func score_add(value):
	score += value
	
func next_level():
	var level_1 = get_parent().get_node("Node2D").get_node("Level").get_node("level_1")
	var level_2 = get_parent().get_node("Node2D").get_node("Level").get_node("level_2")
	var level_3 = get_parent().get_node("Node2D").get_node("Level").get_node("level_3")
	var level_4 = get_parent().get_node("Node2D").get_node("Level").get_node("level_4")
	var level_5 = get_parent().get_node("Node2D").get_node("Level").get_node("level_5")
	var level_6 = get_parent().get_node("Node2D").get_node("Level").get_node("level_6")
	var level_7 = get_parent().get_node("Node2D").get_node("Level").get_node("level_7")
	var level_8 = get_parent().get_node("Node2D").get_node("Level").get_node("level_8")
	var level_9 = get_parent().get_node("Node2D").get_node("Level").get_node("level_9")
	var level_10 = get_parent().get_node("Node2D").get_node("Level").get_node("level_10")
	var level_11 = get_parent().get_node("Node2D").get_node("Level").get_node("level_11")
	var level_12 = get_parent().get_node("Node2D").get_node("Level").get_node("level_12")
	
	
	
	
	var player = get_parent().get_node("Node2D").get_node("Player")
	var node2D = get_parent().get_node("Node2D")
	
	if courent_level == 12: #switch to 12
		player.next_level()
		level_11.toggle_map(false)
		level_12.toggle_map(false)
		level_1.toggle_map(true)
		get_parent().get_node("Node2D").get_node("game_over_sprite").set_visiblity(true)
		player.next_level()
		score *= player.get_health()
		enemies_killed = 0
		enemies_killed_needed = 6 
		courent_level = -1

		
		
			
		courent_level += 1
	
	
	
	if courent_level == 11: #switch to 12
		player.next_level()
		level_11.toggle_map(false)
		level_12.toggle_map(true)
		player.next_level()
		enemies_killed = 0
		enemies_killed_needed = 6
		
		node2D.spwan_enemie(10.0,-60.0,true,2) #true = rechts
		node2D.spwan_enemie(10.0,-75.0,true,2) #true = rechts
		node2D.spwan_enemie(10.0,-90.0,true,2) #true = rechts
		
		node2D.spwan_enemie(230.0,-60.0,false,2) #true = rechts
		node2D.spwan_enemie(230.0,-75.0,false,2) #true = rechts
		node2D.spwan_enemie(230.0,-90.0,false,2) #true = rechts
		
		
			
		courent_level += 1
		
		
	
	if courent_level == 10: #switch to 11
		player.next_level()
		level_10.toggle_map(false)
		level_11.toggle_map(true)
		player.next_level()
		enemies_killed = 0
		enemies_killed_needed = 7
		
		node2D.spwan_enemie(62.0,-172.0,false,2) #true = rechts
		node2D.spwan_enemie(74.0,-187.0,false,2) #true = rechts
		
		node2D.spwan_enemie(110.0,-198.0,false,0)
		node2D.spwan_enemie(127.0,-198.0,false,0)
		node2D.spwan_enemie(150.0,-198.0,true,0)
		
		node2D.spwan_enemie(182.0,-172.0,false,2) 
		node2D.spwan_enemie(197.0,-187.0,false,2) 
			
		courent_level += 1
	
	
	if courent_level == 9: #switch to 10
		player.next_level()
		level_9.toggle_map(false)
		level_10.toggle_map(true)
		player.next_level()
		enemies_killed = 0
		enemies_killed_needed = 5
		
		node2D.spwan_enemie(59.0,-136.0,true,0) #true = rechts
		node2D.spwan_enemie(100.0,-122.0,false,2) #true = rechts
		
		node2D.spwan_enemie(127.0,-130.0,true,2)
		node2D.spwan_enemie(145.0,-122.0,true,2)
		
		node2D.spwan_enemie(114.0,-18.0,false,0)
		node2D.spwan_enemie(140.0,-18.0,true,0)
		
		
		
		courent_level += 1
	
	
	if courent_level == 8: #switch to 9
		player.next_level()
		level_8.toggle_map(false)
		level_9.toggle_map(true)
		player.next_level()
		enemies_killed = 0
		enemies_killed_needed = 5
		
		node2D.spwan_enemie(64.0,-183.0,true,1) #true = rechts
		node2D.spwan_enemie(40.0,-153.0,true,1) #true = rechts
		
		node2D.spwan_enemie(191.0,-184.0,false,1)
		node2D.spwan_enemie(210.0,-153.0,false,1)
		
		node2D.spwan_enemie(128.0,-120.0,false,1)
		
		
		
		courent_level += 1
	
	
	if courent_level == 7: #switch to 8
		player.next_level()
		level_7.toggle_map(false)
		level_8.toggle_map(true)
		player.next_level()
		enemies_killed = 0
		enemies_killed_needed = 4
		
		node2D.spwan_enemie(64.0,-123.0,true,0) #true = rechts
		node2D.spwan_enemie(64.0,-164.0,true,1) #true = rechts
			
		node2D.spwan_enemie(192.0,-161.0,false,1)
		node2D.spwan_enemie(192.0,-120.0,false,0)
		
		courent_level += 1
	
	if courent_level == 6: #switch to 7
		player.next_level()
		level_6.toggle_map(false)
		level_7.toggle_map(true)
		player.next_level()
		enemies_killed = 0
		enemies_killed_needed = 4
		
		node2D.spwan_enemie(15.0,-200.0,true,1) #true = rechts
		node2D.spwan_enemie(30.0,-170.0,true,1) #true = rechts		
		node2D.spwan_enemie(235.0,-200.0,false,1)
		node2D.spwan_enemie(230.0,-170.0,true,1)
		courent_level += 1
	
	if courent_level == 5: #switch to 6
		player.next_level()
		level_5.toggle_map(false)
		level_6.toggle_map(true)
		player.next_level()
		enemies_killed = 0
		enemies_killed_needed = 4
		
		node2D.spwan_enemie(215.0,-180.0,false,0) #true = rechts
		node2D.spwan_enemie(176.0,-137.0,false,1) #true = rechts		
		node2D.spwan_enemie(220.0,-97.0,false,0)
		node2D.spwan_enemie(130.0,-97.0,true,1)
		courent_level += 1
		
	
	if courent_level == 4: #switch to 5
		player.next_level()
		level_4.toggle_map(false)
		level_5.toggle_map(true)
		player.next_level()
		enemies_killed = 0
		enemies_killed_needed = 4
		
		node2D.spwan_enemie(150.0,-180.0,false,0) #true = rechts
		node2D.spwan_enemie(143.0,-137.0,false,0) #true = rechts		
		node2D.spwan_enemie(117.0,-97.0,false,0)
		node2D.spwan_enemie(92.0,-58.0,false,0)
		courent_level += 1
		

	
	if courent_level == 3: #switch to 4
		player.next_level()
		level_3.toggle_map(false)
		level_4.toggle_map(true)
		player.next_level()
		enemies_killed = 0
		enemies_killed_needed = 6
		
		node2D.spwan_enemie(79.0,-57.0,true,0) #true = rechts
		node2D.spwan_enemie(167.0,-57.0,false,0) #true = rechts
		
		node2D.spwan_enemie(60.0,-140.0,true,0)
		node2D.spwan_enemie(185.0,-140.0,false,0)
		
		node2D.spwan_enemie(44.0,-173.0,true,0)
		node2D.spwan_enemie(203.0,-173.0,true,0)
		courent_level += 1
		

	
	if courent_level == 2: #switch to 3
		player.next_level()
		level_2.toggle_map(false)
		level_3.toggle_map(true)
		player.next_level()
		enemies_killed = 0
		enemies_killed_needed = 4
		node2D.spwan_enemie(169.0,-181.0,false,0)
		node2D.spwan_enemie(86.0,-181.0,true,0)
		node2D.spwan_enemie(48.0,-100.0,true,0)
		node2D.spwan_enemie(205.0,-99.0,true,0)
		courent_level += 1
	
	if courent_level == 1: #switch to 2
		level_1.toggle_map(false)
		level_2.toggle_map(true)
		player.next_level()
		enemies_killed = 0 
		enemies_killed_needed = 4
		node2D.spwan_enemie(120.0,-177.0,false,0)
		node2D.spwan_enemie(141.0,-177.0,true,0)
		node2D.spwan_enemie(88.0,-137.0,false,0)
		node2D.spwan_enemie(165.0,-137.0,true,0)
		courent_level += 1
	

func change_levels():
	if enemies_killed == enemies_killed_needed:
		next_level()

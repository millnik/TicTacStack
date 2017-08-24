extends Container

# class member variables go here:
var player1 = "Red"
var player2 = "Computer"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	setPlayer()
	get_node("PlayerLabel").set_text(global.getPlayer()) 
	pass

func setPlayer():
	global.player = null
	global.player1 = player1
	global.player2 = player2
	global.changePlayer()

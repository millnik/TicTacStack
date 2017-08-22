extends Node

func _ready():
	get_node("Button").connect("pressed",self,"_on_ConfirmationDialog_draw")
	get_node("Button1").connect("pressed",self,"_on_goto_menu_pressed")
	pass

func _on_goto_scene_pressed():
	global.reset_gameboard()
	global.goto_scene("res://scenes/Container.tscn")

func _on_goto_menu_pressed():
	global.reset_gameboard()
	global.goto_scene("res://scenes/menu.tscn")

func _on_ConfirmationDialog_draw():
	get_node("ConfirmationDialog").popup_centered()
	get_node("ConfirmationDialog").connect("confirmed",self,"_on_goto_scene_pressed")

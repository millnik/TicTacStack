extends Control

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	get_node("TextureFrame/Button1").connect("pressed",self,"_on_goto_scene_pressed1")
	get_node("TextureFrame/Button2").connect("pressed",self,"_on_goto_scene_pressed2")
	get_node("TextureFrame/Button3").connect("pressed",self,"_on_goto_scene_pressed3")
	get_node("TextureButton").connect("pressed",self,"_on_ConfirmationDialog_draw")
	pass

func _on_goto_scene_pressed1():
	global.goto_scene("res://scenes/Container.tscn")

func _on_goto_scene_pressed2():
	global.goto_scene("res://scenes/Computer.tscn")

func _on_goto_scene_pressed3():
	global.goto_scene("res://scenes/Computer2.tscn")

func _on_ConfirmationDialog_draw():
	get_node("ConfirmationDialog").popup_centered()
	get_node("ConfirmationDialog").connect("confirmed",self,"quit")

func quit():
	get_tree().quit() # Exit the game

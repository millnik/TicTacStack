extends TextureFrame

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	get_node("start").connect("pressed",self,"_on_goto_scene_pressed")
	pass

func _on_goto_scene_pressed():
	global.goto_scene("res://scenes/menu.tscn")

extends Node

var gboard = Array()
var current_scene = null
var screen_size = OS.get_screen_size()
var window_size = OS.get_window_size()
var player = null
var player1 = null
var player2 = null
var player1home = 5
var player2hone = 5

func _ready():
        OS.set_window_position(screen_size*0.5 - window_size*0.5)
        var root = get_tree().get_root()
        current_scene = root.get_child( root.get_child_count() -1 )
        reset_gameboard()

func get_gameboard():
	return gboard

func set_gameboard(board):
	gboard = board

func reset_gameboard():
	gboard = [[ "", "", ""],
              [ "", "", ""],
              [ "", "", ""],
              [ "", "", ""],
              [ "", "", ""],
              [ "", "", ""],
              [ "", "", ""]]

func changePlayer():
	if player == player1:
		player = player2
	else:
		player = player1

func getPlayer():
	return player

func getPlayerChar():
	return player[0]

func goto_scene(path):

    # This function will usually be called from a signal callback,
    # or some other function from the running scene.
    # Deleting the current scene at this point might be
    # a bad idea, because it may be inside of a callback or function of it.
    # The worst case will be a crash or unexpected behavior.

    # The way around this is deferring the load to a later time, when
    # it is ensured that no code from the current scene is running:
    call_deferred("_deferred_goto_scene",path)


func _deferred_goto_scene(path):

    # Immediately free the current scene,
    # there is no risk here.
    #print("Current scene to be freed is: ",current_scene)
    current_scene.free()

    # Load new scene
    var s = ResourceLoader.load(path)

    # Instance the new scene
    current_scene = s.instance()
    #print("Current scene is now: ",current_scene)

    # Add it to the active scene, as child of root
    get_tree().get_root().add_child(current_scene)

    # optional, to make it compatible with the SceneTree.change_scene() API
    #get_tree().set_current_scene( current_scene )

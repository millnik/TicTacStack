extends Sprite

# class member variables go here:
var ev = InputEvent()
var status = "none"
var tsize = Vector2()
var offset = Vector2()
var mpos = Vector2()
var home = Vector2()

func _ready():
    tsize=get_texture().get_size()
    set_process_input(true)
    set_process(true)

func _process(delta):
    if status == "dragging":
        set_global_pos(mpos + offset)

func _input(ev):
	if get_parent().get_parent().get_node("PlayerLabel").get_text() == global.getPlayer():
		# Check if ball has been selected
        if ev.type == InputEvent.MOUSE_BUTTON and ev.button_index == BUTTON_LEFT and ev.is_pressed() and status != "dragging":
            var evpos = ev.pos
            var gpos = get_global_pos()
            var spriterect
            if is_centered():
                spriterect=Rect2(gpos.x-tsize.x/2, gpos.y-tsize.y/2, tsize.x, tsize.y)
            else:
                spriterect=Rect2(gpos.x, gpos.y, tsize.x, tsize.y)
            if spriterect.has_point(evpos):
                if global.getPlayer() == global.player1 and evpos.x < 120:
                    status = "clicked"
                    offset = gpos-evpos
                    home = gpos
                elif global.getPlayer() == global.player2 and evpos.x > 870:
                    status = "clicked"
                    offset = gpos-evpos
                    home = gpos
        # Ball has been selected
        if status=="clicked" and ev.type == InputEvent.MOUSE_MOTION:
            status="dragging"
        # Ball is being moved
        if status=="dragging" and ev.type == InputEvent.MOUSE_BUTTON and ev.button_index == BUTTON_LEFT:
            # Ball released so check for valid move
            if not ev.is_pressed():
                status="released"
                var board = global.get_gameboard()
                # Move ball to Column 0 and limit to 7 balls
                if ev.pos.x > 265 and ev.pos.x < 315 and board[6][0] == "":
                    var empty = 0
                    for i in range(6, -1, -1):
                        if board[i][0] == "":
                            empty = i
                    set_global_pos(Vector2(290,425 - empty * 50))
                    board[empty][0] = global.getPlayerChar()
                    global.set_gameboard(board)
                    global.changePlayer()
                    get_parent().get_parent().get_node("PlayerLabel").set_text(global.getPlayer())
                    for i in range(6, -1, -1):
                        print(i, " - ", board[i][0])
                    print(425 - empty * 50, empty)
                # Move ball to Column 1 and limit to 7 balls
                elif ev.pos.x > 475 and ev.pos.x < 525 and board[6][1] == "":
                    var empty = 0
                    for i in range(6, -1, -1):
                        if board[i][1] == "":
                            empty = i
                    set_global_pos(Vector2(500,425 - empty * 50))
                    board[empty][1] = global.getPlayerChar()
                    global.set_gameboard(board)
                    global.changePlayer()
                    get_parent().get_parent().get_node("PlayerLabel").set_text(global.getPlayer())
                    for i in range(6, -1, -1):
                        print(i, " - ", board[i][1])
                    print(425 - empty * 50, empty)
                # Move ball to Column 2 and limit to 7 balls
                elif ev.pos.x > 695 and ev.pos.x < 745 and board[6][2] == "":
                    var empty = 0
                    for i in range(6, -1, -1):
                        if board[i][2] == "":
                            empty = i
                    set_global_pos(Vector2(720,425 - empty * 50))
                    board[empty][2] = global.getPlayerChar()
                    global.set_gameboard(board)
                    global.changePlayer()
                    get_parent().get_parent().get_node("PlayerLabel").set_text(global.getPlayer())
                    for i in range(6, -1, -1):
                        print(i, " - ", board[i][2])
                    print(425 - empty * 50, empty)
                # Invalid Move, return ball to home position
                else:
	                set_global_pos(home)

        mpos=ev.pos

extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	Dialogic.start('timeline')
	get_viewport().set_input_as_handled()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
func _input(event: InputEvent):
	# check if a dialog is already running
	if Dialogic.current_timeline != null:
		return

	if event is InputEventKey and event.keycode == KEY_ENTER and event.pressed:
		Dialogic.start('timeline')
		get_viewport().set_input_as_handled()

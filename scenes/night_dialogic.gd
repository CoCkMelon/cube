extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready():
	Dialogic.signal_event.connect(_on_dialogic_signal)
	Dialogic.timeline_ended.connect(_on_timeline_ended)

	Dialogic.start('night_scene')
	get_viewport().set_input_as_handled()

func _on_timeline_ended():
	Dialogic.timeline_ended.disconnect(_on_timeline_ended)
	get_tree().change_scene_to_file("res://scenes/city.tscn")

func _on_dialogic_signal(argument:String):
		if argument == "activate_something":
			print("Something was activated!")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

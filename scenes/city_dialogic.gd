extends Node3D
@onready var cube = $"Cube Character"
@onready var poson = $"../WorldEnvironment/city/pos on ship"
# Called when the node enters the scene tree for the first time.
func _ready():
	Dialogic.signal_event.connect(_on_dialogic_signal)
	Dialogic.timeline_ended.connect(_on_timeline_ended)

	Dialogic.start('city')
	get_viewport().set_input_as_handled()

func _on_timeline_ended():
	Dialogic.timeline_ended.disconnect(_on_timeline_ended)
	get_tree().change_scene_to_file("res://scenes/platformer.tscn")

func _on_dialogic_signal(argument:String):
		if argument == "activate_something":
			print("Something was activated!")
		if argument == "move to airship":
			cube.position = poson.position

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

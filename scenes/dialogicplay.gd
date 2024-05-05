extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():   
	Dialogic.timeline_ended.connect(_on_timeline_ended)

	Dialogic.start('timeline')
	get_viewport().set_input_as_handled()

func _on_timeline_ended():
	Dialogic.timeline_ended.disconnect(_on_timeline_ended)
	get_tree().change_scene_to_file("res://scenes/night.tscn")

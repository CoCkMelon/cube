extends MeshInstance3D

@onready var ap = $AnimationPlayer

var tween : Tween
@onready var initpos = position
var stoppingpos: float = 0

@onready var otherc = $"../Cube Another"
@onready var kam0 = $"../../plain with mountains/kameshek pos"

# Called when the node enters the scene tree for the first time.
func _ready():
	Dialogic.signal_event.connect(_on_dialogic_signal)

func _on_dialogic_signal(argument:String):
	if argument == "activate_something":
		print("Something was activated!")
	if argument == "sa":
		stop_animation()
	if argument == "stop":
		stop_animation_now()
	if argument.begins_with("move(") and argument.ends_with(")"):
		# Remove "move(" and ")" from the string
		var parameters = argument.replace("move(", "").replace(")", "")
		# Split the string by commas to get the individual position values
		var position_values = parameters.split(",")
		# Convert the position values from strings to floats
		var x = position_values[0].to_float()
		var y = position_values[1].to_float()
		var z = position_values[2].to_float()
		# Create a new target Vector3 for the desired position
		var target_position = Vector3(x, y, z)
		tween = get_tree().create_tween()

		# Use the Tween node to smoothly interpolate to the target position
		tween.tween_property(self, "position", target_position, 1.0)
		tween.play()

		print("Moving to position:", target_position)
	if argument == "mbk":
		position = initpos
		stoppingpos = 4
	if argument == "look around":
		ap.current_animation = "look around"
		ap.play()
	if argument == "look_at(kam)":
		print("looking at kameshek")
		look_at(kam0.position)
		otherc.look_at(kam0.position)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if stoppingpos > 0.1:
		position = initpos
		stoppingpos -= delta

func stop_animation():
	ap.get_animation(ap.current_animation).loop_mode = false
	
func stop_animation_now():
	ap.stop()

# Function to change the animation
func _on_change_animation(animation_name: String):
	# Change the animation to the one specified by animation_name
	ap.play(animation_name)

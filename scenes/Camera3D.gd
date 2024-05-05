extends Camera3D

# The node we want the camera to follow
@export var target_node: NodePath

# The smoothing factor for the camera position
@export var smoothing_factor: float = 0.1

# The camera's target position
var target_position: Vector2

func _ready():
	# Get the initial position of the target node
	target_position = get_node(target_node).global_position

func _process(delta):
	# Get the target node
	var target = get_node(target_node)
	
	# Update the target position
	target_position = target.global_position
	
	# Smoothly move the camera's global position towards the target position
	global_position = global_position.lerp(target_position, smoothing_factor)
	
	# Update the camera's position and rotation to match the target
	global_position = target_position
	global_rotation = target.global_rotation

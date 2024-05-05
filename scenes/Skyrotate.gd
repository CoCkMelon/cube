extends MeshInstance3D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Define your angular speed here (radians per second)
@export var angular_speed = Vector3(1.0, 2.0, 3.0)  # Example values for x, y, and z axis

func _process(delta):
	# Apply rotation to each axis
	rotate_object_local(Vector3.UP, angular_speed.y * delta/100)
	rotate_object_local(Vector3.RIGHT, angular_speed.x * delta/100)
	rotate_object_local(Vector3.FORWARD, angular_speed.z * delta/100)

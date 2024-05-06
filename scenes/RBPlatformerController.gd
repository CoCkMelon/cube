extends RigidBody3D

@export var SPEED = 0.5
@export var JUMP_VELOCITY = 10

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

func _physics_process(delta):
	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		apply_impulse(Vector3.UP * JUMP_VELOCITY)

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	var direction = (transform.basis * Vector3(0, 0, input_dir.x)).normalized()
	if direction != Vector3.ZERO:
		apply_impulse(direction*SPEED)
	#else:
		#var current_velocity = get_linear_velocity()
		#var new_velocity = Vector3(move_toward(current_velocity.x, 0, SPEED), current_velocity.y, move_toward(current_velocity.z, 0, SPEED))
		#set_linear_velocity(new_velocity)

func is_on_floor() -> bool:
	if get_contact_count() == 0:
		return false
	#var rayStart = position
	#var rayEnd = rayStart - Vector3.UP * 10.0
	#var space_state = get_world_3d().direct_space_state
	#var query = PhysicsRayQueryParameters3D.create(rayStart, rayEnd)
	#var result = space_state.intersect_ray(query)
	#if result.size() > 0:
		#print("fgdf")
		#return false
	return true

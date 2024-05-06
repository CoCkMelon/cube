extends CharacterBody3D

# Define your constants
const GRAVITY = 20
const SPEED = 20
const JUMP_FORCE = 10

# Define your variables
var is_jumping = false

func _physics_process(delta):
	# Handle input
	var move_input = Vector3()
	move_input.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	move_input.z = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	move_input = move_input.normalized()

	# Apply horizontal speed
	velocity.x = SPEED * move_input.x
	velocity.z = SPEED * move_input.z

	# Apply gravity
	velocity.y -= GRAVITY

	# Jumping
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		is_jumping = true
		velocity.y = JUMP_FORCE

	# Move and collide
	var collision = move_and_collide(velocity * delta)

	# If we collided with something above us, we're no longer jumping
	if collision and collision.get_normal().dot(Vector3.UP) < 0:
		is_jumping = false

	# If we're not jumping and we're on the ground, reset the jump flag
	if is_on_floor() and is_jumping:
		is_jumping = false

	# If we collided with something, push it away
	if collision:
		collision.get_collider().apply_impulse(collision.get_normal() * 10, collision.get_position())

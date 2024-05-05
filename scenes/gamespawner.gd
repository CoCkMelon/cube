extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready():
	Dialogic.signal_event.connect(_on_dialogic_signal)

func _on_dialogic_signal(argument:String):
	if argument == "activate_something":
		print("Something was activated in Node3D!")
	if argument == "add cube 2":
	# Create a MeshInstance node
		var mesh_instance = MeshInstance3D.new()
		
		# Create a cube mesh and assign it to the MeshInstance
		var cube_mesh = BoxMesh.new()
		mesh_instance.mesh = cube_mesh
		mesh_instance.position.x = -4
		mesh_instance.rotate_x(10)
		mesh_instance.rotate_z(10)
		
		# Add the MeshInstance as a child of the current node
		add_child(mesh_instance)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

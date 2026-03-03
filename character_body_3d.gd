extends CharacterBody3D

var SPEED = 10
var JUMP_VELOCITY = 10

# 1. Get a reference to your camera
@onready var camera: Camera3D = $Camera3D 

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	
	if Input.is_action_just_pressed("run"):
		SPEED = 15
	elif Input.is_action_just_released("run"):
		SPEED = 10
	# Get the input direction
	var input_dir := Input.get_vector("a", "d", "w", "s")
	
	# 2. Calculate direction based on camera rotation
	# We use the camera's horizontal (XZ) plane so movement stays level
	var look_direction := camera.global_transform.basis
	var direction := (look_direction * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	
	# Optional: Keep the Y component at 0 to prevent movement speed bugs when looking up/down
	direction.y = 0
	direction = direction.normalized()

	if direction != Vector3.ZERO:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()

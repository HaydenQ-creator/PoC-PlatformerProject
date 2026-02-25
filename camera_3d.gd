extends Camera3D

var mouse_sensitivity = 0.002
var camera_anglev = 0

func _input(event):
	if event is InputEventMouseMotion:
		# Horizontal
		rotate_y(-event.relative.x * mouse_sensitivity)
		
		# Vertical
		var changev = -event.relative.y * mouse_sensitivity
		if camera_anglev + changev > -1 and camera_anglev + changev < 1:
			rotate_x(changev)
			camera_anglev += changev

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

extends Node3D # or whatever node holds the script

# Reference the SpotLight3D node. Adjust the path "$SpotLight3D" if necessary.
@onready var light = $SpotLight3D

func _input(event): 
	# Check if the "ui_interact" action is pressed
	if event.is_action_pressed("ui_interact"):
		# Toggle visibility: if it's true, make it false; if false, make it true.
		light.visible = !light.visible

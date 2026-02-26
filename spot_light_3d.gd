extends Node3D

# Using @onready ensures the node is loaded before the script tries to find it.
# Make sure "SpotLight3D" matches the exact name in your Scene Tree.
@onready var light: SpotLight3D = $SpotLight3D

func _input(event: InputEvent) -> void: 
	# 1. Check for the action
	if event.is_action_pressed("ui_interact"):
		# 2. Safety check: ensure the light wasn't deleted or renamed
		if light:
			light.visible = !light.visible
		else:
			push_error("SpotLight3D node not found! Check your scene tree names.")

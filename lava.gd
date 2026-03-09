extends StaticBody3D

var HP = 100

@onready var Lava: StaticBody3D 
var rise_speed: float = 1
	
func _process(delta):
	position.y += rise_speed * delta
	print(HP)
	if HP <= 0:
		get_tree().quit()
	
	
func _on_body_entered(body: CharacterBody3D):
	if body.is_in_group("Lava"):
		print("Player entered the area!")
		HP -= 25
	

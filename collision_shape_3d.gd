extends CollisionShape3D

var HP = 100
var Lava = false
func _on_body_entered(body : CollisionShape3D):
	if body.is_in_group("Player"):
		Lava = true
		
func _process(delta: float) -> void:
	if Lava:
		HP -= 25 * delta  
		if HP <= 0:
			print("no more hp")
			Lava = false 

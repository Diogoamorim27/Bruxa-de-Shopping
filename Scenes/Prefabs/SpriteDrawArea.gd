extends Area2D



func _on_SpriteDrawArea_body_entered(body):
	if body.name == "Player":
			body.z_index = -1
	pass # Replace with function body.


func _on_SpriteDrawArea_body_exited(body):
	if body.name == "Player":
			body.z_index = 2
	pass # Replace with function body.

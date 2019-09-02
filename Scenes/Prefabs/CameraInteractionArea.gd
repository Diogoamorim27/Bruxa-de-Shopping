extends Area2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	if get_tree().get_nodes_in_group("dialogue_panel"):
		connect("body_entered", get_tree().get_nodes_in_group("dialogue_panel")[0], "_on_CameraObstacle_body_entered")

func _on_CameraInteractionArea_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed:
		print("camera_clicked")
		get_tree().call_group("dialogue_panel", "_camera_clicked")
	pass # Replace with function body.

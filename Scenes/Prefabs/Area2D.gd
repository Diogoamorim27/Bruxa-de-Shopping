extends Area2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	if get_tree().get_nodes_in_group("dialogue_panel"):
		connect("body_entered", get_tree().get_nodes_in_group("dialogue_panel")[0], "_on_CameraObstacle_body_entered")
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

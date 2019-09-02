extends Area2D

func _ready():
	if get_tree().get_nodes_in_group("dialogue_panel")[0]: 
		connect("body_entered", get_tree().get_nodes_in_group("dialogue_panel")[0], "_on_DoorObstacle_body_entered")
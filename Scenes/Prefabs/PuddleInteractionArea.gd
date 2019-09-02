extends Area2D

func _ready():
	if get_tree().get_nodes_in_group("dialogue_panel")[0]: 
		connect("body_entered", get_tree().get_nodes_in_group("dialogue_panel")[0], "_on_PuddleObstacle_body_entered")
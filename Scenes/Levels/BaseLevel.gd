extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var trashcans = get_tree().get_nodes_in_group("trashcans")
onready var player = get_tree().get_nodes_in_group("player")[0]
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	for trashcan in trashcans:
		if player.global_position.y > trashcan.global_position.y:
			trashcan.set_z_index(1)
		else:
			trashcan.set_z_index(3)
#	pass


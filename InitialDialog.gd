extends Control

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	$Panel._start_obstacle_dialogue("starting_dialog", $Player)
	pass # Replace with function body.


func _on_Panel_hide():
	get_tree().change_scene("res://Scenes/Levels/Tutorial.tscn")
	pass # Replace with function body.

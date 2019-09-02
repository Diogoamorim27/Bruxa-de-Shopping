extends Node

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var obstacle_dialogues
# Called when the node enters the scene tree for the first time.
func _ready():
	var file = File.new() 
	file.open("res://Assets/JSON/obstacle_dialog.JSON", file.READ)
	obstacle_dialogues = parse_json(file.get_as_text())
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

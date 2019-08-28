extends Node

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var text_box_dictionary
# Called when the node enters the scene tree for the first time.
func _ready():
	var file = File.new() 
	file.open("res://Assets/Text/teste.JSON", file.READ)
	text_box_dictionary = parse_json(file.get_as_text())
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

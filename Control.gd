extends Control

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var popup : = $DialogPopup
onready var dialogue_box_label : = $DialogPopup/Panel/Label
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass




func _on_PuddleInteractionArea_body_entered(body):
		if body.name == "Player":
			popup.popup()
			body.state = 4
			dialogue_box_label.text = TextData.text_box_dictionary.puddle



func _on_CameraInteractionArea_body_entered(body):
		if body.name == "Player":
			popup.popup()
			body.state = 4
			dialogue_box_label.text = TextData.text_box_dictionary.camera


func _on_TextureRect_gui_input(event):
	if event == InputEventMouseButton:
		$LootPopup/GridContainer/TextureRect.rect_position = get_global_mouse_position()
	pass # Replace with function body.

extends StaticBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var interaction_area : = $InteractionArea
onready var alert_sprite : = $Alert/Sprite
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	alert_sprite.visible = false
	for body in interaction_area.get_overlapping_bodies():
		if body.name == "Player":
			_show_alert()
			
	
func _show_alert():
	alert_sprite.visible = true

func _on_InteractionArea_input_event(viewport, event, shape_idx):
	for body in interaction_area.get_overlapping_bodies():
		if body.name == "Player":
			if event is InputEventMouseButton:
				if event.pressed:
					$Control/PopupPanel.popup_centered()
	pass # Replace with function body.

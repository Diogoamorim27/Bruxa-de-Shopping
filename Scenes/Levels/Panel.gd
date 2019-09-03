extends Panel

onready var player : KinematicBody2D = get_tree().get_nodes_in_group("player")[0]
onready var label : = $Label

enum {ITEM_DESCRIPTION, OBSTACLE_DIALOG}

var dialogue_type : int
var dialogue_index : = 0
var current_dialogue : Array

func _ready():
	pass # Replace with function body.

func _on_item_clicked(item_category):
	self.visible = true
	label.text = ItemDB.ITEM_DESCRIPTIONS[item_category]
	dialogue_type = ITEM_DESCRIPTION
	
func _input(event):
	if event is InputEventMouseButton and event.pressed:
		if dialogue_type == ITEM_DESCRIPTION:
			self.visible = false
		elif dialogue_type == OBSTACLE_DIALOG:
			dialogue_index += 1
			if  current_dialogue.size() > dialogue_index:
				label.text = current_dialogue[dialogue_index]
			else:
				dialogue_index = 0
				self.visible = false
				player.state = 0
		
func _on_CameraObstacle_body_entered(body):
	_start_obstacle_dialogue("camera_fov", body)
		
func _on_PuddleObstacle_body_entered(body):
	if body.name == "Player":
		print("puddle_entered")
	_start_obstacle_dialogue("wet_floor", body)
	
func _on_DoorObstacle_body_entered(body):
	_start_obstacle_dialogue("store_entrance", body)
	
func _start_obstacle_dialogue(obstacle : String, body : Object):
		if body.name == "Player":
				dialogue_index = 0
				player.state = 4
				dialogue_type = OBSTACLE_DIALOG
				visible = true
				current_dialogue = TextData.obstacle_dialogues[obstacle]
				label.text = current_dialogue[0]
				
func _trashcan_opened():
	_start_obstacle_dialogue("trashcan_opened", player)
	
func _camera_clicked():
	_start_obstacle_dialogue("camera_clicked", player)
	
	
	
extends Panel

onready var player : KinematicBody2D = get_tree().get_nodes_in_group("player")[0]
onready var label : = $Label

enum {ITEM_DESCRIPTION, OBSTACLE_DIALOG}
const wrong_recipe_texts = ["wrong_recipe1","wrong_recipe2","wrong_recipe3","wrong_recipe4","wrong_recipe5"]

var dialogue_type : int
var dialogue_index : = 0
var current_dialogue : Array
var cam_triggered= false
var wrong_recipe_index = 0

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
#				player.state = 0
		
func _on_CameraObstacle_body_entered(body):
	if player.state != 1:
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
#				player.state = 4
				dialogue_type = OBSTACLE_DIALOG
				visible = true
				current_dialogue = TextData.obstacle_dialogues[obstacle]
				label.text = current_dialogue[0]
				
func _start_spell_dialogue(obstacle : String):
		dialogue_index = 0
		dialogue_type = OBSTACLE_DIALOG
		visible = true
		current_dialogue = TextData.obstacle_dialogues[obstacle]
		label.text = current_dialogue[0]
				

func _trashcan_opened():
	_start_obstacle_dialogue("trashcan_opened", player)
	

func _on_CameraDialogTrigger_body_entered(body):
	if !cam_triggered:
		_start_obstacle_dialogue("camera_warning", player)
		cam_triggered = true
	pass # Replace with function body.
	
func wrong_recipe_dialog():
	_start_obstacle_dialogue(wrong_recipe_texts[wrong_recipe_index], player)
	if wrong_recipe_index < 4:
		wrong_recipe_index += 1
	else:
		wrong_recipe_index = 0
	print("nogo")
	
func spell_dialog(spell):
	if spell == "invisible":
		_start_spell_dialogue("invisibilidade")
	elif spell ==  "goo":
		_start_spell_dialogue("goo")
	elif spell == "floating":
		_start_spell_dialogue("levitacao")
	elif spell == "overpower":
		_start_spell_dialogue("overpower")

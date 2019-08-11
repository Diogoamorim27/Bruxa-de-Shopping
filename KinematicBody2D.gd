extends KinematicBody2D

export var player_speed : int
export var accel : int
export var deaccel : int

var movement : = Vector2()
var target_speed : = Vector2()

func _ready():
	pass 

func _process(delta):
	var input : = _get_directional_input()
	_update_movement(input, delta)
	move_and_slide(movement)
	pass

func _get_directional_input() -> Vector2:
	var input : = Vector2()
	if Input.is_action_pressed("ui_left"):
		input.x = -1
	elif Input.is_action_pressed("ui_right"):
		input.x = 1
		
	if Input.is_action_pressed("ui_up"):
		input.y = -1
	elif Input.is_action_pressed("ui_down"):
		input.y = 1
	
	return input.normalized()
	
func _update_movement(input : Vector2, delta : float):
	var target = input * player_speed
	var acceleration
	if input != Vector2():
		acceleration = accel
	else:
		acceleration = deaccel
		
	movement = lerp(movement, target, acceleration * delta)
	pass
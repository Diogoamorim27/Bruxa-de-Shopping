extends KinematicBody2D

enum states {DEFAULT, INVISIBLE, GOO, FLOATING, INTERACTING}

onready var timer : = $Timer
onready var sprite : = $icon
export var player_speed : int
export var accel : int
export var deaccel : int

var movement : = Vector2()
var state = states.DEFAULT
var timer_ready : = true

func _ready():
	pass 

func _process(delta):
	var input : = _get_directional_input()
	match state:
		states.DEFAULT:
			_update_movement(input, delta)
			
			#PROVISORY SPELLS ACTIVATION#
			if Input.is_action_just_pressed("numkey_1"):
				timer_ready = false
				timer.start()
				state = states.INVISIBLE
			if Input.is_action_just_pressed("numkey_2"):
				timer_ready = false
				timer.start()
				state = states.GOO
			if Input.is_action_just_pressed("numkey_3"):
				timer_ready = false
				timer.start()
				state = states.FLOATING
			
			
			
		states.INVISIBLE:
			sprite.modulate = Color(1, 0, 0)
			_update_movement(input, delta)
			self.collision_layer = 2
			self.collision_mask = 2
			# POWER OVER #
			if timer_ready == true:
				state = states.DEFAULT
				$icon.modulate = Color(1 ,1, 1)
				self.collision_layer = 1
				self.collision_mask = 1
		states.GOO:
			sprite.modulate = Color(0, 1, 0)
			_update_movement(input, delta)
			self.collision_layer = 4
			self.collision_mask = 4
			# POWER OVER #
			if timer_ready == true:
				state = states.DEFAULT
				$icon.modulate = Color(1 ,1, 1)
				self.collision_layer = 1
				self.collision_mask = 1
		states.FLOATING:
			sprite.modulate = Color(0, 0, 1)
			_update_movement(input, delta)
			self.collision_layer = 8
			self.collision_mask = 8
			# POWER OVER #
			if timer_ready == true:
				state = states.DEFAULT
				$icon.modulate = Color(1 ,1, 1)
				self.collision_layer = 1
				self.collision_mask = 1
		states.INTERACTING:
			pass
			
	movement  = move_and_slide(movement)
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
	

func _on_Timer_timeout():
	timer_ready = true
	

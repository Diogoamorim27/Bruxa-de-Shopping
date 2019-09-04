extends KinematicBody2D

enum states {DEFAULT, INVISIBLE, GOO, FLOATING, INTERACTING}# , IDLE}
#const animation_states = { 0 : "Walking", 1 : "Invisible", 2: "Goo", 3 : "Floating", 4 : "Interacting", 5 : "Idle"}


onready var timer : = $Timer
onready var sprite : = $icon
onready var animation_player : = $AnimationPlayer
onready var opacity_animator : = $OpacityAnimator

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
				enter_state(states.INVISIBLE)
			if Input.is_action_just_pressed("numkey_2"):
				timer_ready = false
				timer.start()
				state = states.GOO
			if Input.is_action_just_pressed("numkey_3"):
				timer_ready = false
				timer.start()
				state = states.FLOATING
			
			
			
		states.INVISIBLE:
			_update_movement(input, delta)
			self.collision_layer = 2
			self.collision_mask = 2

			# POWER OVER #
			if timer_ready == true:
				opacity_animator.play_backwards("GoInvisible")
				state = states.DEFAULT
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
			_update_movement(Vector2(),delta)
			pass
	
	_handle_animation()
	movement  = move_and_slide(movement)
	pass

func _get_directional_input() -> Vector2:
	var input : = Vector2()
	if Input.is_action_pressed("ui_right"):
		input.x = 1
	elif Input.is_action_pressed("ui_left"):
		input.x = -1
	elif Input.is_action_pressed("ui_up"):
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
		
#	movement = lerp(movement, target, acceleration * delta)
	movement = target
	pass
	

func _on_Timer_timeout():
	timer_ready = true
	

func _on_Popup_popup_hide():
	state = states.DEFAULT
	pass # Replace with function body.
	
func _handle_animation():
	if round(movement.x) < 0:
		sprite.flip_h = true
	elif round(movement.x) > 0:
		sprite.flip_h = false

	if round(movement.x) and animation_player.current_animation != "WalkingSideways":
		animation_player.play("WalkingSideways")
	elif round(movement.y) < 0 and animation_player.current_animation != "WalkingUp":
		animation_player.play("WalkingUp")
	elif round(movement.y) > 0 and animation_player.current_animation != "WalkingDown":
		animation_player.play("WalkingDown")
	elif !round(movement.x) and !round(movement.y) and animation_player.current_animation != "Idle":
		animation_player.play("Idle")
#	match state:
#		states.DEFAULT:
#
	pass

func enter_state(new_state):
	timer_ready = false
	timer.start()
	state = new_state
	if new_state == states.INVISIBLE:
		opacity_animator.play("GoInvisible")
	
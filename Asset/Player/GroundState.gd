extends State

class_name GroundState

@export var jump_velocity : float = -150.0
@export var air_state : State
@export var attack_state : State


func state_input(event : InputEvent):
	if(event.is_action_pressed("jump")):
		jump()
	if(event.is_action_pressed("attack")):
		attack()

func jump():
	character.velocity.y = jump_velocity
	next_state = air_state
	playback.travel("jump_start")

func attack():
	next_state = attack_state
	playback.travel("attack1")


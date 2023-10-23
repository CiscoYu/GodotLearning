extends State

class_name AirState

var was_double_jump : bool = false
var double_jump_velocity : float = -125.0
@export var landing_state : State
@export var ground_state : State

func state_process(delta):
	if(character.is_on_floor()):
		next_state = landing_state
		
func state_input(event : InputEvent):
	if(event.is_action_pressed("jump") && !was_double_jump):
		double_jump()

func double_jump():
	character.velocity.y = double_jump_velocity
	playback.travel("double_jump")
	was_double_jump = true

func on_exit():
	if(next_state == landing_state):
		playback.travel("jump_end")
		was_double_jump = false

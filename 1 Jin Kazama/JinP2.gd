extends CharacterBody2D

@export var yes  = 1 
@onready var animations2 = $AnimationPlayer

const max_speed = 520
const accel = 1000
const friction = 3000
var input = Vector2.ZERO

func _physics_process(delta):
	player_movement(delta)

func get_input():
	input.x = int(Input.is_action_pressed("ui_L")) - int(Input.is_action_pressed("ui_J"))
	if int(Input.is_action_pressed("ui_L")) == 1:
		return input.normalized()
	elif int(Input.is_action_pressed("ui_J")) == 1:
		return input.normalized()
	elif int(Input.is_action_pressed("ui_K")) == 1:
		animations2.play("crouch2")
		return input.normalized()
	else:
		animations2.play("idle2")
		return input.normalized()

	
func player_movement(delta):
	input = get_input()
	
	if input == Vector2.ZERO:
		if velocity.length()>(friction*delta):
			velocity -= velocity.normalized() * (friction * delta)
		else:
			velocity = Vector2.ZERO
	else: 
		velocity += (input * accel * delta)
		velocity = velocity.limit_length(max_speed)
	move_and_slide()
	



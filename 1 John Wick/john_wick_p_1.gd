extends CharacterBody2D

@export var yes  = 1 
@onready var animationsWick1 = $AnimationPlayer

const max_speed = 520
const accel = 1000
const friction = 3000
var input = Vector2.ZERO

func _physics_process(delta):
	player_movement(delta)

func get_input():
	input.x = int(Input.is_action_pressed("ui_D")) - int(Input.is_action_pressed("ui_A"))
	if int(Input.is_action_pressed("ui_A")) == 1:
		return input.normalized()
	elif int(Input.is_action_pressed("ui_D")) == 1:
		return input.normalized()
	elif int(Input.is_action_pressed("ui_S"))  == 1:
		animationsWick1.play("Wickcrouch1")
		return input.normalized()
	elif int(Input.is_action_pressed("ui_Q")) == 1:
		animationsWick1.play("Wickpunch1")
		return input.normalized()
	elif int(Input.is_action_pressed("ui_W")) ==1:
		animationsWick1.play("Wickjump1")
		return input.normalized()
	else:
		animationsWick1.play("Wickidle1")
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

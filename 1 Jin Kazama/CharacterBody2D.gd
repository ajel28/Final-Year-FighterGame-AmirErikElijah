extends CharacterBody2D

@export var yes  = 1 
@onready var animationsDp1 = $AnimationPlayer
@onready var healthbar = $p1Health

const max_speed = 520
const accel = 1000
const friction = 3000
var input = Vector2.ZERO

func ready():
	Global.healthp1=100
	Global.healthbar.init_health(Global.healthp1)
	
func _set_health(value):
	Global._set_health(value)
	Global.healthp1 = Global.healthp1
	
	
func _physics_process(delta):
	player_movement(delta)

func get_input():
	input.x = int(Input.is_action_pressed("ui_D")) - int(Input.is_action_pressed("ui_A"))
	if int(Input.is_action_pressed("ui_D")) == 1:
		return input.normalized()
	elif int(Input.is_action_pressed("ui_A")) == 1:
		return input.normalized()
	elif int(Input.is_action_pressed("ui_S"))  == 1:
		animationsDp1.play("crouch")
		return input.normalized()
	elif int(Input.is_action_pressed("ui_Q")) == 1:
		animationsDp1.play("kick")
		return input.normalized()
	else:
		animationsDp1.play("idle")
		return input.normalized()

	
	
func player_movement(delta):
	input = get_input()
	
	if input == Vector2.ZERO:
		if velocity.length()>(friction*delta):
			velocity -= velocity.normalized() * (friction * delta)
		else:
			velocity = Vector2.ZERO
	else: 
		velocity += ((input * accel * delta))
		velocity = velocity.limit_length(max_speed)
	move_and_slide()
	


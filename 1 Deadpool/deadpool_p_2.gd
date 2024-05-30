extends CharacterBody2D

@export var yes  = 1 
@onready var animationsDp2 = $AnimationPlayer
var punch = false

const max_speed = 520
const accel = 1000
const friction = 3000
var input = Vector2.ZERO

func _physics_process(delta):
	player_movement(delta)

func get_input():
	input.x = int(Input.is_action_pressed("ui_L")) - int(Input.is_action_pressed("ui_J"))
	if int(Input.is_action_pressed("ui_L")) == 1:
		punch = false
		global_position = global_position.clamp(Vector2(-700,-999), Vector2(2800,750))
		return input.normalized()
	elif int(Input.is_action_pressed("ui_J")) == 1:
		punch = false
		global_position = global_position.clamp(Vector2(-700,-999), Vector2(2800,750))
		return input.normalized()
	elif int(Input.is_action_pressed("ui_K"))  == 1:
		punch = false
		animationsDp2.play("deadpoolcrouch2")
		return input.normalized()
	elif int(Input.is_action_pressed("ui_U")) == 1:
		punch = true
		animationsDp2.play("deadpoolpunch2")
		return input.normalized()
	elif int(Input.is_action_pressed("ui_I")) ==1:
		var punch = false
		animationsDp2.play("deadpooljump2")
		return input.normalized()
	else:
		var punch = false
		animationsDp2.play("deadpoolidle2")
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


func _on_deadpool_p_2_punch_area_entered(area):
	if !(area is DeadpoolHurtbox2):
		if punch==true:
			Global.healthp1-=0.5
			print(Global.healthp1)

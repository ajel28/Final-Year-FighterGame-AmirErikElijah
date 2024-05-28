extends CharacterBody2D

@export var yes  = 1 
@onready var animationsWick2 = $AnimationPlayer
var punch = false

const max_speed = 520
const accel = 1000
const friction = 3000
var input = Vector2.ZERO

func _physics_process(delta):
	player_movement(delta)

func get_input():
	input.x = int(Input.is_action_pressed("ui_L")) - int(Input.is_action_pressed("ui_J"))
	if int(Input.is_action_pressed("ui_J")) == 1:
		punch = false
		return input.normalized()
	elif int(Input.is_action_pressed("ui_L")) == 1:
		punch = false
		return input.normalized()
	elif int(Input.is_action_pressed("ui_K"))  == 1:
		punch = false
		animationsWick2.play("Wickcrouch1")
		return input.normalized()
	elif int(Input.is_action_pressed("ui_U")) == 1:
		punch = true
		animationsWick2.play("Wickpunch1")
		return input.normalized()
	elif int(Input.is_action_pressed("ui_I")) ==1:
		punch = false
		animationsWick2.play("Wickjump1")
		return input.normalized()
	else:
		punch = false
		animationsWick2.play("Wickidle1")
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


func _on_wick_p_2_punch_area_entered(area):
	if punch == true:
		Global.healthp1-=0.5
		print(Global.healthp1)

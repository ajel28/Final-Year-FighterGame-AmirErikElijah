extends CharacterBody2D

class_name jwP2
@export var yes  = 1 
@onready var animationsWick2 = $AnimationPlayer
@export var jump_height : float
@export var jump_time_to_peak : float
@export var jump_time_to_descent: float

@onready var jump_velocity : float = ((2.0 * jump_height) / jump_time_to_peak) * -1.0
@onready var jump_gravity : float = ((-2.0 * jump_height) / (jump_time_to_peak *jump_time_to_peak)) * -1.0
@onready var fall_gravity: float = ((-2.0 * jump_height) / (jump_time_to_peak *jump_time_to_descent)) * -1.0
var punch = false

const max_speed = 520
const accel = 1000
const friction = 3000
var input = Vector2.ZERO

func _physics_process(delta):
	velocity.y += get_gravity() * delta
	player_movement(delta)
	if Input.is_action_just_pressed("ui_I") and is_on_floor():
		jump()

func get_gravity() -> float:
	return jump_gravity if velocity.y < 0.0 else fall_gravity
	

func jump():
	velocity.y = jump_velocity

func get_input():
	input.x = int(Input.is_action_pressed("ui_L")) - int(Input.is_action_pressed("ui_J"))
	if int(Input.is_action_pressed("ui_J")) == 1:
		global_position = global_position.clamp(Vector2(-1550,-999), Vector2(0,750))
		punch = false
		return input.normalized()
	elif int(Input.is_action_pressed("ui_L")) == 1:
		global_position = global_position.clamp(Vector2(-1550,-999), Vector2(0,750))
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
	global_position = global_position.clamp(Vector2(-1550,-999), Vector2(0,750))


func _on_wick_p_2_punch_area_entered(area):
	if !(area is WickHurtbox2):
		if punch == true:
			Global.healthp1-=2
			print(Global.healthp1)

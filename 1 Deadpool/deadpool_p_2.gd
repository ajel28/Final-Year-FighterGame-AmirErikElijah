extends CharacterBody2D

class_name dpP2
@export var yes  = 1 
@onready var animationsDp2 = $AnimationPlayer
@export var jump_height : float
@export var jump_time_to_peak : float
@export var jump_time_to_descent: float

var knockbackPower: int=500

@onready var jump_velocity : float = ((2.0 * jump_height) / jump_time_to_peak) * -1.0
@onready var jump_gravity : float = ((-2.0 * jump_height) / (jump_time_to_peak *jump_time_to_peak)) * -1.0
@onready var fall_gravity: float = ((-2.0 * jump_height) / (jump_time_to_peak *jump_time_to_descent)) * -1.0
var punch = false

@export var P2Wins: PackedScene

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
	if int(Input.is_action_pressed("ui_L")) == 1:
		punch = false
		Global.isAttacking=false
		global_position = global_position.clamp(Vector2(-1550,-999), Vector2(0,750))
		return input.normalized()
	elif int(Input.is_action_pressed("ui_J")) == 1:
		punch = false
		Global.isAttacking=false
		global_position = global_position.clamp(Vector2(-1550,-999), Vector2(0,750))
		return input.normalized()
	elif int(Input.is_action_pressed("ui_K"))  == 1 and StaminaBar.Stamina.time_left>=4:
		punch = false
		Global.isAttacking=false
		animationsDp2.play("deadpoolcrouch2")
		return input.normalized()
	elif int(Input.is_action_pressed("ui_U")) == 1:
		punch = true
		Global.isAttacking=true
		animationsDp2.play("deadpoolpunch2")
		return input.normalized()
	elif int(Input.is_action_pressed("ui_I")) ==1:
		var punch = false
		Global.isAttacking=false
		animationsDp2.play("deadpooljump2")
		return input.normalized()
	else:
		var punch = false
		Global.isAttacking=false
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
	global_position = global_position.clamp(Vector2(-1550,-999), Vector2(0,750))


func _on_deadpool_p_2_punch_area_entered(area):
	if !(area is DeadpoolHurtbox2):
		if punch==true:
			Global.hitsInRowP1 = 0
			Global.hitsInRowP2+=1;
			Global.healthp1-=2
			print(Global.healthp1)
		if Global.hitsInRowP2 == 3:
			$Triple.play()
		elif Global.hitsInRowP2 == 5:
			$Fatality.play()
		if Global.healthp1 <= 0:
			var p2 = P2Wins.instantiate()
			add_child(p2)

func _on_deadpool_p_2_hurtbox_area_entered(area):
	if(Global.isAttacking==true and punch==false):
		knockback()


func knockback():
	var knockbackDirection = -velocity.normalized()*knockbackPower
	velocity= knockbackDirection
	move_and_slide()

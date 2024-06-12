extends CharacterBody2D

class_name jinP1
@export var yes  = 1 
var kick = false
@onready var animationsJinp1 = $AnimationPlayer
@export var jump_height : float
@export var jump_time_to_peak : float
@export var jump_time_to_descent: float

@onready var jump_velocity : float = ((2.0 * jump_height) / jump_time_to_peak) * -1.0
@onready var jump_gravity : float = ((-2.0 * jump_height) / (jump_time_to_peak *jump_time_to_peak)) * -1.0
@onready var fall_gravity: float = ((-2.0 * jump_height) / (jump_time_to_peak *jump_time_to_descent)) * -1.0

const max_speed = 520
const accel = 1000
const friction = 3000
var input = Vector2.ZERO

func _physics_process(delta):
	velocity.y += get_gravity() * delta
	player_movement(delta)
	if Input.is_action_just_pressed("ui_W") and is_on_floor():
		jump()

func get_gravity() -> float:
	return jump_gravity if velocity.y < 0.0 else fall_gravity
	

func jump():
	velocity.y = jump_velocity
	
func get_input():
	input.x = int(Input.is_action_pressed("ui_D")) - int(Input.is_action_pressed("ui_A"))
	if int(Input.is_action_pressed("ui_D")) == 1:
		global_position = global_position.clamp(Vector2(-150,-999), Vector2(1400,750))
		animationsJinp1.play("jinwalk")
		get_node("ShieldP1").hide()
		return input.normalized()
		kick=false
	elif int(Input.is_action_pressed("ui_A")) == 1:
		global_position = global_position.clamp(Vector2(-150,-999), Vector2(1400,750))
		animationsJinp1.play("jinwalk")
		get_node("ShieldP1").hide()
		return input.normalized()
		kick=false
	elif int(Input.is_action_pressed("ui_S")) == 1 and StaminaBar.Stamina.time_left>=4:
		animationsJinp1.play("crouch")
		get_node("ShieldP1").show()
		return input.normalized()
		kick=false
	elif int(Input.is_action_pressed("ui_Q")) == 1:
		animationsJinp1.play("kick")
		get_node("ShieldP1").hide()
		kick=true
		return input.normalized()
	else:
		get_node("ShieldP1").hide()
		animationsJinp1.play("idle")
		return input.normalized()
		kick=false

	
	
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
	global_position = global_position.clamp(Vector2(-150,-999), Vector2(1400,750))


func _on_kick_area_2d_area_entered(area):
	if !(area is JinHurtbox1):
		if kick==true:
			Global.healthp2-=3
			print(Global.healthp2)


func _on_jin_p_1_hurtbox_area_entered(area):
	if (area is Med):
		Global.healthp1+=5
		area.queue_free()
	if(Global.healthp1>=100):
		Global.healthp1=100

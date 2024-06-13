extends CharacterBody2D

class_name mcP1

@export var yes  = 1 
@onready var animationsMC1 = $AnimationPlayer
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
	if Input.is_action_just_pressed("ui_W") and is_on_floor():
		jump()

func get_gravity() -> float:
	return jump_gravity if velocity.y < 0.0 else fall_gravity
	

func jump():
	velocity.y = jump_velocity

func get_input():
	input.x = int(Input.is_action_pressed("ui_D")) - int(Input.is_action_pressed("ui_A"))
	if int(Input.is_action_pressed("ui_D")) == 1:
		global_position = global_position.clamp(Vector2(-180,-999), Vector2(1400,750))
		animationsMC1.play("mcwalk")
		return input.normalized()
		punch = false
		get_node("ShieldP1").hide()
	elif int(Input.is_action_pressed("ui_A")) == 1:
		global_position = global_position.clamp(Vector2(-180,-999), Vector2(1400,750))
		animationsMC1.play("mcwalk")
		return input.normalized()
		punch = false
		get_node("ShieldP1").hide()
	elif int(Input.is_action_pressed("ui_S"))  == 1 and StaminaBar.Stamina.time_left>=4:
		punch = false
		get_node("ShieldP1").show()
		animationsMC1.play("mc_crouch")
		return input.normalized()
	elif int(Input.is_action_pressed("ui_Q")) == 1:
		punch = true
		get_node("ShieldP1").hide()
		animationsMC1.play("mc_punch")
		return input.normalized()
	elif int(Input.is_action_pressed("ui_W")) ==1:
		punch = false
		get_node("ShieldP1").hide()
		animationsMC1.play("mc_jump")
		return input.normalized()
	else:
		punch = false
		get_node("ShieldP1").hide()
		animationsMC1.play("mc_idle")
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
	global_position = global_position.clamp(Vector2(-180,-999), Vector2(1400,750))
	



func _on_mc_punch_p_1_area_entered(area):
	if !(area is Med):
		if punch==true:
			Global.healthp2-=4
			print(Global.healthp2)


func _on_mcp_1_hurtbox_area_entered(area):
	if !(area is Med):
		$MC1.modulate = Color.RED
		await get_tree().create_timer(0.1).timeout
		$MC1.modulate = Color.WHITE
	
	elif (area is Med):
		Global.healthp1+=5
		area.queue_free()
		$MC1.modulate = Color.GREEN_YELLOW
		await get_tree().create_timer(0.1).timeout
		$MC1.modulate = Color.WHITE
	elif(Global.healthp1>=100):
		Global.healthp1=100

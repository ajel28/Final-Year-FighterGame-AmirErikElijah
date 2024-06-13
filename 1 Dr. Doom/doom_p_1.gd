extends CharacterBody2D

class_name doomP1
@export var yes  = 1 
@onready var animationsDoom1= $AnimationPlayer
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
	if int(Input.is_action_pressed("ui_A")) == 1:
		global_position = global_position.clamp(Vector2(-180,-999), Vector2(1400,750))
		animationsDoom1.play("doom_walk1")
		get_node("ShieldP1").hide()
		return input.normalized()
	elif int(Input.is_action_pressed("ui_D")) == 1:
		global_position = global_position.clamp(Vector2(-180,-999), Vector2(1400,750))
		animationsDoom1.play("doom_walk1")
		get_node("ShieldP1").hide()
		return input.normalized()
	elif int(Input.is_action_pressed("ui_S"))  == 1 and StaminaBar.Stamina.time_left>=4:
		animationsDoom1.play("doomcrouch1")
		get_node("ShieldP1").show()
		return input.normalized()
	elif int(Input.is_action_pressed("ui_Q")) == 1:
		Global.punchP1 = true
		animationsDoom1.play("doompunch1")
		get_node("ShieldP1").hide()
		return input.normalized()
	elif int(Input.is_action_pressed("ui_W")) ==1:
		get_node("ShieldP1").hide()
		animationsDoom1.play("doomjump1")
		return input.normalized()
	else:
		animationsDoom1.play("doomidle1")
		get_node("ShieldP1").hide()
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
	global_position = global_position.clamp(Vector2(-180,-999), Vector2(1400,750))


func _on_doom_p_1_hurtbox_area_entered(area):
	if !(area is Med):
		$TextureRect.modulate = Color.RED
		await get_tree().create_timer(0.1).timeout
		$TextureRect.modulate = Color.WHITE
	elif (area is Med):
		Global.healthp1+=5
		area.queue_free()
		$TextureRect.modulate = Color.GREEN_YELLOW
		await get_tree().create_timer(0.1).timeout
		$TextureRect.modulate = Color.WHITE
	if(Global.healthp1>=100):
		Global.healthp1=100

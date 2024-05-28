extends CharacterBody2D

@export var yes  = 1 
@onready var animationsRocky1 = $AnimationPlayer
var punch = false


const max_speed = 520
const accel = 1000
const friction = 3000
var input = Vector2.ZERO

func _physics_process(delta):
	player_movement(delta)

func get_input():
	input.x = int(Input.is_action_pressed("ui_D")) - int(Input.is_action_pressed("ui_A"))
	if int(Input.is_action_pressed("ui_A")) == 1:
		punch = false
		return input.normalized()
	elif int(Input.is_action_pressed("ui_D")) == 1:
		punch = false
		return input.normalized()
	elif int(Input.is_action_pressed("ui_S"))  == 1:
		punch = false
		animationsRocky1.play("rockycrouch1")
		return input.normalized()
	elif int(Input.is_action_pressed("ui_Q")) == 1:
		punch = true
		animationsRocky1.play("rockypunch1")
		return input.normalized()
	elif int(Input.is_action_pressed("ui_W")) ==1:
		punch = false
		animationsRocky1.play("rockyjump1")
		return input.normalized()
	else:
		punch = false
		animationsRocky1.play("rockyidle1")
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


func _on_rocky_p_1_punch_area_entered(area):
	if !(area is RockyHurtbox1):
		if punch==true:
			Global.healthp2-=0.5
			print(Global.healthp2)

extends TextureProgressBar
class_name StaminaBarPlayer1
@onready var Stamina = $TextureProgressBar
var can_regen = false
var time_to_wait = 3
var s_timer = 0
var can_start_timer = true

# Called when the node enters the scene tree for the first time.
func _ready():
	value = max_value

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (can_regen == false && value != 100 or value == 0):
		can_start_timer = true
		if (can_start_timer):
			s_timer += delta
			if (s_timer >= time_to_wait):
				can_regen = true
				can_start_timer = false
				s_timer = 0

	if (value == 100):
		can_regen = false
	
	if (can_regen == true):
		value += 1
		can_start_timer = false
		s_timer = 0
		
	if (Input.is_action_just_pressed("ui_W")):
		value -= 10
		can_regen = false
		s_timer = 0
	
	if (Input.is_action_just_pressed("ui_S")):
		value -= 15
		can_regen = false
		s_timer = 0


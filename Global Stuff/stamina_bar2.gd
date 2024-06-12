extends TextureProgressBar
class_name StaminaBarP2
var Stamina = Timer.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	Stamina.set_wait_time(12)
	Stamina.autostart=true
	add_child(Stamina)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	updateStamina()

func updateStamina():
	if (Input.is_action_just_pressed("ui_K")):
		pass
	if (Input.is_action_just_pressed("ui_I")):
		value -= 7

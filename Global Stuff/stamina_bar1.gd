extends TextureProgressBar
class_name StaminaBarPlayer1
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
	value = Stamina.time_left * 12.5-50
		

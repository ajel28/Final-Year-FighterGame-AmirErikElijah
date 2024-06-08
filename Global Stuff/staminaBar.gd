extends TextureProgressBar

var Stamina = Timer.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	Stamina.set_wait_time(12)
	add_child(Stamina)

func start():
	Stamina.start()
# Called every frame. 'delta' is the elapsed time since the previous frame.

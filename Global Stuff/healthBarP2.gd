extends TextureProgressBar
class_name HealthBar2
var maxHealth = Global.maxHealthp2

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta): 
		update()
	

func update():
	value = Global.healthp2 *100 / maxHealth

	

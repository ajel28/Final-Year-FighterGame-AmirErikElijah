extends TextureProgressBar

var maxHealth = Global.maxHealthp1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta): 
		update()
	

func update():
	value = Global.healthp1 *100 / maxHealth

	

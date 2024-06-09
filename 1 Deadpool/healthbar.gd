extends TextureProgressBar
class_name HealthBar
var maxHealth = Global.maxHealthp1

@export var P1Wins: PackedScene
@export var P2Wins: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta): 
		update()
	

func update():
	value = Global.healthp1 *100 / maxHealth
	if Global.healthp2<=0:
		var p1 = P1Wins.instantiate()
		add_child(p1)
	if Global.healthp1<=0:
		var p2 = P2Wins.instantiate()
		add_child(p2)
	if Global.healthp1==10 or Global.healthp1==8:
		$FinishHim.play()
	if Global.healthp2==10 or Global.healthp2==8:
		$FinishHim.play()

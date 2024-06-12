extends Label

@export var tied: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	update()
	
func update():
	self.text=str(int($Timer.time_left))
	if $Timer.time_left==0:
		get_tree().paused=true
		var tie = tied.instantiate()
		add_child(tie)
		

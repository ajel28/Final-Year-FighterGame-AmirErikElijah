extends TextureProgressBar


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	update()

func update():
	value = $Timer.time_left*250
	
func _input(event):
	if Input.is_action_pressed("ui_Q"):
		$Timer.start()


func _on_timer_timeout():
	$Timer.stop()

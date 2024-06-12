extends TextureProgressBar


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _process(delta):
	update()

func update():
	value = $Timer2.time_left*250
	
func _input(event):
	if Input.is_action_pressed("ui_U") and $Timer2.time_left==0:
		$Timer2.start()


func _on_timer_2_timeout():
	$Timer2.stop()

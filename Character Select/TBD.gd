extends TextureRect


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_deathstroke_button_pressed():
	self.show()
	$Timer.start()
	if $Timer.time_left==0:
		$Timer.stop()
		self.hide()
	


func _on_venom_button_pressed():
	self.show()
	$Timer.start()
	if $Timer.time_left==0:
		$Timer.stop()
		self.hide()

func _on_iron_fist_button_pressed():
	self.show()
	$Timer.start()
	if $Timer.time_left==0:
		$Timer.stop()
		self.hide()


func _on_bane_button_pressed():
	self.show()
	$Timer.start()
	if $Timer.time_left==0:
		$Timer.stop()
		self.hide()


func _on_r_hulk_button_pressed():
	self.show()
	$Timer.start()
	if $Timer.time_left>=1:
		$Timer.stop()
		self.hide()


func _on_hulk_button_pressed():
	self.show()
	$Timer.start()
	if $Timer.time_left>=1:
		$Timer.stop()
		self.hide()

extends ProgressBar

@onready var timer = $Timer

@onready var damage_bar = $DamageBar

var healthp1 = 0 : set = _set_health

func _set_health(new_health):
	var prev_health=healthp1
	healthp1=min(max_value, new_health)
	value=healthp1
	if healthp1<=0:
		queue_free()
	if healthp1<prev_health:
		timer.start()
	else:
		damage_bar.value=healthp1
	
	
func init_healthp1(_health):
	healthp1=_health
	max_value=healthp1
	value=healthp1
	damage_bar.max_value=healthp1
	damage_bar.value=healthp1

func _on_timer_timeout():
	damage_bar.value=healthp1

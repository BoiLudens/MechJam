extends PathFollow

var runSpeed = 5
var level_end = false

signal route_ended(old_route)

func _ready():
	set_loop(false)
	set_process(false)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if !level_end:
		if (unit_offset>= 1):
			emit_signal("route_ended", self)
		else:
			set_offset(get_offset() + runSpeed * delta)


func _on_FinishArea_body_entered(body):
	level_end = true;
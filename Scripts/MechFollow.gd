extends PathFollow

var runSpeed = 5

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	set_offset(get_offset() + runSpeed * delta)

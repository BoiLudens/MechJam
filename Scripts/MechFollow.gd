extends PathFollow

var runSpeed = 5

func _ready():
	set_loop(false)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	set_offset(get_offset() + runSpeed * delta)

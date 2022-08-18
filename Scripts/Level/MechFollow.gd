extends PathFollow

var runSpeed = 5
var level_end = false

func _ready():
	set_loop(false)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if !level_end:
		set_offset(get_offset() + runSpeed * delta)


func _on_FinishArea_body_entered(body):
	level_end = true;

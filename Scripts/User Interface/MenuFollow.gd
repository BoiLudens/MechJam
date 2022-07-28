extends PathFollow

var runSpeed = 1
var forward = false
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if get_unit_offset() < .9 and forward:
		set_offset(get_offset() + runSpeed * delta)
	if get_unit_offset() >= .9:
		get_tree().change_scene("res://Scenes/Main.tscn")
	
func move_forward():
	forward = true

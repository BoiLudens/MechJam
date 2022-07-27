extends Spatial

var rayOrigin = Vector3()
var rayEnd = Vector3()

onready var camera = $ClippedCamera

func _process(delta):
	var intersection = check_ray_hit()
	if not intersection.empty():
		if Input.is_action_pressed("fire"):
			get_tree().change_scene("res://Scenes/Main.tscn")
	

func check_ray_hit():
	#var rid = $".".get_rid()
	var space_state = get_world().direct_space_state
	var mouse_position = get_viewport().get_mouse_position()
	rayOrigin = camera.project_ray_origin(mouse_position)
	rayEnd = rayOrigin + camera.project_ray_normal(mouse_position) * 2000
	return space_state.intersect_ray(rayOrigin, rayEnd)

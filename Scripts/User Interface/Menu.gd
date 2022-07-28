extends Spatial

var rayOrigin = Vector3()
var rayEnd = Vector3()

onready var camera = $Path/PathFollow/ClippedCamera
onready var camera_path = $Path/PathFollow
onready var cockpit_animator = $Cockpit/AnimationPlayer
onready var seat = $"Cockpit/Cockpit Armature/Cockpit Root/Chair Base/Chair Seat001"


func _process(delta):
	var intersection = check_ray_hit()
	if not intersection.empty():
		if Input.is_action_pressed("fire"):
			if intersection.collider.name == 'Start':
				camera_path.move_forward()
				cockpit_animator.play("Seat Ready")
				seat.hide()
			elif intersection.collider.name == 'Credits':
				var credits_text = """BoiLudens Programmer \n
									Synell Programmer \n
									Zetfer Narc \n
									Null Art Director \n
									Rook Scrub"""
				intersection.collider.set_label_text(credits_text)

func check_ray_hit():
	var space_state = get_world().direct_space_state
	var mouse_position = get_viewport().get_mouse_position()
	rayOrigin = camera.project_ray_origin(mouse_position)
	rayEnd = rayOrigin + camera.project_ray_normal(mouse_position) * 2000
	return space_state.intersect_ray(rayOrigin, rayEnd)

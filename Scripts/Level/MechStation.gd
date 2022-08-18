extends Spatial


var rayOrigin = Vector3()
var rayEnd = Vector3()

onready var camera = $ClippedCamera
onready var battery = $"Armature/Skeleton/BoneAttachment7/Battery"
#onready var camera_path = $Path/PathFollow
#onready var cockpit_animator = $Cockpit/AnimationPlayer
#onready var seat = $"Cockpit/Cockpit Armature/Cockpit Root/Chair Base/Chair Seat001"


func _process(delta):
	var intersection = check_ray_hit()
	if not intersection.empty():
		print(intersection.collider.name)
		if Input.is_action_pressed("fire"):
			if intersection.collider.name == 'Battery2':
				intersection.collider.translation = Vector3(0,0,0)
				battery.hide()
			if intersection.collider.name == 'Battery3':
				intersection.collider.translation = Vector3(0,0,0)
				battery.hide()

func check_ray_hit():
	var space_state = get_world().direct_space_state
	var mouse_position = get_viewport().get_mouse_position()
	rayOrigin = camera.project_ray_origin(mouse_position)
	rayEnd = rayOrigin + camera.project_ray_normal(mouse_position) * 2000
	return space_state.intersect_ray(rayOrigin, rayEnd)

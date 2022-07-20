extends KinematicBody

export (PackedScene) var bullet_scene

onready var camera = $ClippedCamera
onready var bullet_left_spawn = $"Armature/Skeleton/BoneAttachment3/Left Gun/Bullet Spawn"
onready var bullet_right_spawn = $"Armature/Skeleton/BoneAttachment/Right Gun/Bullet Spawn"

var rayOrigin = Vector3()
var rayEnd = Vector3()
var left = true
var bullet_can_spawn = true

func _physics_process(delta):

	var rid = $".".get_rid()
	var space_state = get_world().direct_space_state
	var mouse_position = get_viewport().get_mouse_position()
	
	rayOrigin = camera.project_ray_origin(mouse_position)
	rayEnd = rayOrigin + camera.project_ray_normal(mouse_position) * 2000
	
	var intersection = space_state.intersect_ray(rayOrigin, rayEnd, [rid], 3)
	if not intersection.empty():
		var target = intersection.position
		if Input.is_action_pressed("fire") and bullet_can_spawn:
			var bullet = bullet_scene.instance()
			bullet_spawn_location(bullet, target)
			
			
			
func bullet_spawn_location(bullet, target):
	if left == true:
		bullet_left_spawn.add_child(bullet)
		bullet.instantiate(bullet_left_spawn.global_transform, target)
		left = false
		bullet_can_spawn = false
	else:
		bullet_right_spawn.add_child(bullet)
		bullet.instantiate(bullet_right_spawn.global_transform, target)
		left = true
		bullet_can_spawn = false


func _on_Bullet_Timer_timeout():
	bullet_can_spawn = true

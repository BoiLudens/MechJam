extends KinematicBody

export (PackedScene) var bullet_scene
export (PackedScene) var crosshair_scene
export (PackedScene) var secondary_crosshair_scene

var cursor_default = load("res://Textures/cursor2.png")
var cursor_hit = load("res://Textures/cursor.png")
var cursor_target = load("res://Textures/cursor3.png")


onready var camera = $ClippedCamera
onready var bullet_left_spawn = $"Armature/Skeleton/BoneAttachment3/Left Gun/Bullet Spawn"
onready var bullet_right_spawn = $"Armature/Skeleton/BoneAttachment/Right Gun/Bullet Spawn"
onready var secondary_spawn = $"Armature/Skeleton/BoneAttachment7/Battery/Bullet Spawn"

var rayOrigin = Vector3()
var rayEnd = Vector3()

var left = true
var bullet_can_spawn = true
var secondary_can_spawn = true

func _process(delta):
	var intersection = check_ray_hit()
	if not intersection.empty():
		var target_position = intersection.position
		Input.set_custom_mouse_cursor(cursor_target)
		if !check_for_crosshair(intersection.collider):
			var crosshair = crosshair_scene.instance()
			intersection.collider.add_child(crosshair)
		if Input.is_action_pressed("fire"):
			Input.set_custom_mouse_cursor(cursor_hit)
		if Input.is_action_pressed("fire") and bullet_can_spawn:
			var spawn_location = bullet_right_spawn if left else bullet_left_spawn
			bullet_spawn_location(spawn_location, target_position)
	else:
		Input.set_custom_mouse_cursor(cursor_default)
	if Input.is_action_pressed("secondary"):
		check_for_secondary_crosshair()
		if Input.is_action_pressed("fire") and secondary_can_spawn:
			var bullet = bullet_scene.instance()
			var current_secondary_crosshairs = get_tree().get_nodes_in_group("secondary-crosshairs")
			for target in current_secondary_crosshairs:
				secondary_spawn_location(secondary_spawn, target.get_parent().transform.origin)
			secondary_can_spawn = false
		
func check_ray_hit():
	var rid = $".".get_rid()
	var space_state = get_world().direct_space_state
	var mouse_position = get_viewport().get_mouse_position()
	rayOrigin = camera.project_ray_origin(mouse_position)
	rayEnd = rayOrigin + camera.project_ray_normal(mouse_position) * 2000
	return space_state.intersect_ray(rayOrigin, rayEnd, [rid], 3)

func check_for_crosshair(target):
	for n in target.get_children():
		if n.name == 'Crosshair' or n.name == 'Secondary-Crosshair':
			return true
	return false
	
func check_for_secondary_crosshair():
	var current_crosshairs = get_tree().get_current_scene().get_tree().get_nodes_in_group("crosshairs")
	for crosshair in current_crosshairs:
		var secondary_crosshair = secondary_crosshair_scene.instance()
		crosshair.get_parent().add_child(secondary_crosshair)
		crosshair.queue_free()

func bullet_spawn_location(spawn_location, target):
	var bullet = bullet_scene.instance()
	bullet_left_spawn.add_child(bullet)
	bullet.instantiate(spawn_location.global_transform, target)
	left = not left
	bullet_can_spawn = false

func secondary_spawn_location(spawn_location, target):
	var bullet = bullet_scene.instance()
	secondary_spawn.add_child(bullet)
	bullet.instantiate(spawn_location.global_transform, target)

func _on_Bullet_Timer_timeout():
	bullet_can_spawn = true

func _on_SecondaryTimer_timeout():
	secondary_can_spawn = true

extends Area


export var speed = 30
export var rotation_speed = 2.1

var velocity = Vector3()
var rot = Vector3()
var target
var direction
var rotateAmount
export(PackedScene) var explosion_fx

func _ready():
	set_as_toplevel(true)
	set_physics_process(false)
	
func _physics_process(delta):
	direction = target.global_transform.origin  - global_transform.origin
	direction = direction.normalized()
	
	rotateAmount = direction.cross(global_transform.basis.z)
	rot.y = rotateAmount.y * rotation_speed * delta
	rot.x = rotateAmount.x * rotation_speed * delta
	rotate(Vector3.UP, rot.y)
	rotate(Vector3.RIGHT, rot.x)
	
	global_translate(-global_transform.basis.z * speed * delta)



func _on_HomingChip_body_entered():
	queue_free()


func _on_Lifetime_timeout():
	queue_free()


func _on_Area_body_entered(body):
	if body.name == 'Player':
		target = body
		set_physics_process(true)

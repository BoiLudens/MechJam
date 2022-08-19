extends Area


export var speed = 5
export var rotation_speed = 2.1

var velocity = Vector3()
var rot = Vector3()
# Another node in the scene can be exported as a NodePath.
export(NodePath) var node_path
# Do take note that the node itself isn't being exported -
# there is one more step to call the true node:
onready var target = get_node(node_path)
export(PackedScene) var explosion_fx

func _ready():
	pass
	
func _physics_process(delta):
	var direction = target.global_transform.origin  - global_transform.origin
	direction = direction.normalized()
	
	var rotateAmount = direction.cross(global_transform.basis.z)
	rot.y = rotateAmount.y * rotation_speed * delta
	rot.x = rotateAmount.x * rotation_speed * delta
	rotate(Vector3.UP, rot.y)
	rotate(Vector3.RIGHT, rot.x)
	
	global_translate(-global_transform.basis.z * speed * delta)

func set_target(_target):
	target = _target


func _on_HomingChip_body_entered():
	queue_free()


func _on_Lifetime_timeout():
	queue_free()

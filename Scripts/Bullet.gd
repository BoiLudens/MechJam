extends RigidBody

export (PackedScene) var hit_particles_scene

func _ready():
	set_as_toplevel(true)

func _physics_process(delta):
	apply_impulse(global_transform.basis.z, -global_transform.basis.z * 10)

func instantiate(start, target):
	transform = start
	look_at(target, Vector3.UP)

func _on_Bullet_body_entered(body):
	var hit_particles = hit_particles_scene.instance()
	body.queue_free()
	add_child(hit_particles)
	hit_particles.transform = transform
	


func _on_Timer_timeout():
	queue_free()

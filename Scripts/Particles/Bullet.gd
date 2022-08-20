extends RigidBody

export (PackedScene) var hit_particles_scene
export (PackedScene) var chip_scene

var rng = RandomNumberGenerator.new()
var chip_list = []

func _ready():
	set_as_toplevel(true)

func _physics_process(delta):
	apply_impulse(global_transform.basis.z, -global_transform.basis.z * 10)

func instantiate(start, target):
	transform = start
	look_at(target, Vector3.UP)

func _on_Bullet_body_entered(body):
	if body.is_in_group('mobs'):
		spawn_particles()
		spawn_chips()
		body.queue_free()
		queue_free()
	
func _on_Timer_timeout():
	queue_free()

# Called when the node enters the scene tree for the first time.
func spawn_chips():
	var chip = chip_scene.instance()
	get_parent().add_child(chip)
	chip.set_target(get_parent())
	chip.transform = transform

func spawn_particles():
	var hit_particles = hit_particles_scene.instance()
	get_parent().add_child(hit_particles)
	hit_particles.transform = transform

extends Spatial

export (PackedScene) var chip_scene
var rng = RandomNumberGenerator.new()
var chip_list = []
# Called when the node enters the scene tree for the first time.
func _ready():
	for n in 10:
		
		rng.randomize()
		Vector3(rng.randf_range(-10.0, 10.0),
		rng.randf_range(-10.0, 10.0),
		rng.randf_range(-10.0, 10.0))
		
		var chip = chip_scene.instance()
		
		add_child(chip)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

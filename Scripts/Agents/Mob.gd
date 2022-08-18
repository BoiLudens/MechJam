extends KinematicBody

signal enemy_hit

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.



# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Mob_tree_exited():
	emit_signal("enemy_hit")

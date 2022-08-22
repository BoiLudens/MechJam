extends KinematicBody
	
func take_damage():
	get_tree().call_group("gamemanager", "enemies_hit_increment")
	queue_free()

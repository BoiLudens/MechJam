extends Spatial


onready var enemies_label = $CSGBox/EnemiesLabel
onready var chips_label = $CSGBox/ChipsLabel
onready var robo_bois_label = $CSGBox/RoboBoisLabel
onready var rank_label = $CSGBox2/RankLabel

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func set_all_labels(enemy_count, chips_count, robo_bois_count):
	enemies_label.text = 'ENEMIES ROUTED: ' + str(enemy_count)

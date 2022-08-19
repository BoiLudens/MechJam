extends Node

var enemies_hit = 0
var chips_collected = 0
var robo_bois_saved = 0

onready var player = $Path/PathFollow/Player
onready var results = $FinishArea/ResultsScreen
onready var label = $Label3D


func _ready():
	label.text = "start"
	
	var mobs = get_tree().get_nodes_in_group("mobs")
	for mob in mobs:
		mob.connect("enemy_hit", self, "_on_Mob_enemy_hit")

func _on_Mob_enemy_hit():
	enemies_hit += 1
	label.text = "hit"


func _on_FinishArea_body_entered(body):
	results.set_all_labels(enemies_hit, 0, 0)

extends Node

var enemies_hit = 0
var chips_collected = 0
var robo_bois_saved = 0

onready var player = $Path/PathFollow/Player
onready var results = $FinishArea/ResultsScreen
onready var label = $Label3D

func _ready():
	label.text = "start"

func enemies_hit_increment():
	enemies_hit += 1

func chips_collected_increment():
	chips_collected += 1

func _on_FinishArea_body_entered(body):
	results.set_all_labels(enemies_hit, chips_collected, robo_bois_saved)
	
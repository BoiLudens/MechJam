extends Area

onready var results = $ResultsScreen

func _ready():
	results.hide()


func _on_FinishArea_body_entered(body):
	results.visible = true

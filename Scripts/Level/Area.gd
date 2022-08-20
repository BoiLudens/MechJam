extends Area

onready var results = $ResultsScreen

func _ready():
	results.hide()


func _on_FinishArea_body_entered(body):
	if body.is_in_group("players"):
		results.visible = true

tool
extends KinematicBody

onready var label = $Label3D

export var label_text = 'default'


func _ready():
	label.text = label_text

func set_label_text(new_text):
	label.text = new_text
	

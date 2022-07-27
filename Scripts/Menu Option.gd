extends KinematicBody

onready var label = $Sprite3D/Viewport/Label

export var labeltext = 'default'


func _ready():
	label.text = labeltext

extends Control

onready var secondary_weapon = $"Armature/Skeleton/BoneAttachment7/Battery"

func _ready():
	$VBoxContainer/Button.grab_focus()


func _on_Button_pressed():
	secondary_weapon.queue_free()
	

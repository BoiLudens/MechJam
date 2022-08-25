extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var player = get_node("%Player")

onready var start_route = $StartPath/PlayerPathFollow
onready var route = $Route/PathFollow

# Called when the node enters the scene tree for the first time.
func _ready():
	start_route.set_process(true)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


# func _on_Route1Trigger_switch_tracks(track):
# 	player.get_parent().remove_child(player)
# 	route.add_child(player)


func _on_PlayerPathFollow_route_ended(old_route):
	old_route.remove_child(player)
	old_route.unit_offset = 0
	old_route.set_process(false)
	route.add_child(player)
	route.set_process(true);


extends Node2D

@onready var door = $Door
var level_index = 1
var level_dictionary = {
	1: "res://Stages/Pantheons/Panth1/Pant1.tscn",
	2: "res://Stages/Pantheons/Panth2/Pant2.tscn",
	3: "res://Stages/Pantheons/Panth3/Pant3.tscn"
}

func _ready():
	door.hide()
	
func _process(delta):
	if door.visible == false:
		if get_tree().get_nodes_in_group("enemies").is_empty():
			door.change_disable()
			$Camera2D.screen_shake(12,0.5)
			door.show()	

func _on_door_body_entered(body):
	if body.is_in_group("player"):
		level_index += 1
		get_tree().change_scene_to_file(level_dictionary[level_index])

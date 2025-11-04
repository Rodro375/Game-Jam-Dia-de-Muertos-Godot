extends Node2D

@onready var door = $Door
@onready var animation_player = $AnimationPlayer

var level_dictionary = {
	1: "res://Stages/Pantheons/Panth1/Pant1.tscn",
	2: "res://Stages/Pantheons/Panth2/Pant2.tscn",
	3: "res://Stages/Pantheons/Panth3/Pant3.tscn",
	4: "res://Stages/Pantheons/Panth4/Pant4.tscn",
	5: "res://UI/GraciasPorJugar.tscn"
}

func _ready():
	door.hide()
	
func _process(delta):
	if door.visible == false:
		if get_tree().get_nodes_in_group("enemies").is_empty():
			door.change_disable()
			$Camera2D.screen_shake(12,0.65)
			door.show()

func _on_door_body_entered(body):
	if body.is_in_group("player"):
		animation_player.play("Transition_Next_Scene")
		body.queue_free()

func load_next_scene():
	Global.level_index += 1
	get_tree().change_scene_to_file(level_dictionary[Global.level_index])

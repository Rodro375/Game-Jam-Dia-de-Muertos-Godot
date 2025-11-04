extends Control



func _on_jugar_pressed():
	$"Escena principal".show()
	$AnimationPlayer.play("Pasar a escena")

func _on_creditos_pressed():
	if $Creditos.visible == false:
		$Creditos.visible = true
	else:
		$Creditos.visible = false

func _on_salir_pressed():
	get_tree().quit()

func load_panth():
	get_tree().change_scene_to_file("res://Stages/Pantheons/Panth1/Pant1.tscn")

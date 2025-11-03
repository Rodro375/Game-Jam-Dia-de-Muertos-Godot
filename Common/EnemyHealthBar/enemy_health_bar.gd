extends Node2D

@onready var progress_bar:TextureProgressBar = $ProgressBar
@onready var enemy = self.owner

func _process(delta):
	progress_bar.value = enemy.current_health * 100 / enemy.max_health

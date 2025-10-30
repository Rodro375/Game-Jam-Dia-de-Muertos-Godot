extends PlayerStateBase

@onready var progress_bar:TextureProgressBar = $"."

func ready():
	player.health_changed.connect(update())
	update()

func update():
	progress_bar.value = player.current_health * 100 / player.max_health

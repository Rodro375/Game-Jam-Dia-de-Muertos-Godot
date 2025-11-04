extends CanvasLayer

@onready var progress_bar:TextureProgressBar = $ProgressBar
@onready var parry_charges:TextureProgressBar = $ParryCharges
@onready var player:Player = self.owner

func _ready():
	progress_bar.value = Global.player_health * 100 / player.max_health
	$Sprite2D.frame = Global.player_current_strenght - 1 

func _on_player_health_changed():
	progress_bar.value = player.current_health * 100 / player.max_health

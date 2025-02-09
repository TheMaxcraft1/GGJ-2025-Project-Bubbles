extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if MusicPlayer.stream != MusicPlayer.LevelMusic:
		MusicPlayer.setLevelMusic()
		
	if self.name == "Level2":
		GameManager.isLvl2Disabled = false
	elif self.name == "Level3":
		GameManager.isLvl3Disabled = false
	elif self.name == "Level4":
		GameManager.isLvl4Disabled = false

func _process(delta: float) -> void:
	if Input.is_action_just_released("ui_cancel"):
		$HUD/NextLevelMenu.disableNextLevelButton = !$HUD/NextLevelMenu.disableNextLevelButton
		$HUD/NextLevelMenu.visible = !$HUD/NextLevelMenu.visible

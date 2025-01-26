extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if GameManager.isLvl2Disabled:
		$HBoxContainer/Lvl2Button.disabled = true
	if GameManager.isLvl3Disabled:
		$HBoxContainer/Lvl3Button.disabled = true
	if GameManager.isLvl4Disabled:
		$HBoxContainer/Lvl4Button.disabled = true

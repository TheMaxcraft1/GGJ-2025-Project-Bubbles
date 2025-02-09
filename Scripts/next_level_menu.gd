extends Control

@export var nextLevel: String
var disableNextLevelButton: bool = false

func _ready() -> void:
	$HBoxContainer/NextLevelButton.level = nextLevel

func _process(delta: float) -> void:
	if disableNextLevelButton:
		$HBoxContainer/NextLevelButton.disabled = true
	else:
		$HBoxContainer/NextLevelButton.disabled = false
	

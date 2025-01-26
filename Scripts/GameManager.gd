extends Node

enum BUBBLE_MODES { BIG_BUBBLE, SMALL_BUBBLES } # BUBBLE MODES FROM WHICH THE PLAYER SWAPS



# CHANGE THIS ON PIPE PASS
var lvl1Stars = 0

var isLvl2Disabled: bool = true
var lvl2TimeSpent: float = 0.0
var lvl2Stars = 0

var isLvl3Disabled: bool = true
var lvl3TimeSpent: float = 0.0
var lvl3Stars = 0

var isLvl4Disabled: bool = true
var lvl4TimeSpent: float = 0.0
var lvl4Stars = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("ui_cancel"):
		get_tree().quit()

extends Node

enum BUBBLE_MODES { BIG_BUBBLE, SMALL_BUBBLES } # BUBBLE MODES FROM WHICH THE PLAYER SWAPS

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("ui_cancel"):
		get_tree().quit()

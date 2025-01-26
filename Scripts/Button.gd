extends StaticBody2D

@export var relatedGate : StaticBody2D

var UNPRESSED_SPRITE = preload("res://Sprites/Buttons/UnpressedButton.png")
var PRESSED_SPRITE = preload("res://Sprites/Buttons/PressedButton.png")
var RED_COLOR : Color = Color("ff0000")
var GREEN_COLOR: Color = Color("009b00")

var isButtonPressed: bool = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if isButtonPressed:
		$Sprite2D.texture = PRESSED_SPRITE
		$PointLight2D.color = GREEN_COLOR
	else:
		$Sprite2D.texture = UNPRESSED_SPRITE
		$PointLight2D.color = RED_COLOR

func _on_button_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("Box"):
		isButtonPressed = true
		relatedGate.openGate()

func _on_button_area_2d_body_exited(body: Node2D) -> void:
	if body.is_in_group("Box"):
		isButtonPressed = false
		relatedGate.closeGate()

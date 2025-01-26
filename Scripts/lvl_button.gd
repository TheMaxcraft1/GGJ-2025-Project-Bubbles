extends Button

@export var level: String


var originalSize = scale
var growSize = Vector2(1.1, 1.1)

func _on_mouse_entered() -> void:
	growButton(growSize, .1)
	
func _on_mouse_exited() -> void:
	growButton(originalSize, .1)
	
func growButton(endSize: Vector2, duration: float) -> void:
	var tween = create_tween().set_trans(Tween.TRANS_LINEAR).set_ease(Tween.EASE_IN_OUT)
	tween.tween_property(self, "scale", endSize, duration) 



func _on_pressed() -> void:
	if level == null:
		return
	
	SceneTransition.change_scene(level)

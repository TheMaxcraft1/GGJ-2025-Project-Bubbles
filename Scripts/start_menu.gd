extends Control

@export var LevelSelectionScene: String

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	MusicPlayer.setMenuMusic()

func _on_play_button_pressed() -> void:
	SceneTransition.change_scene(LevelSelectionScene)


func _on_credits_button_pressed() -> void:
	$AnimationPlayer.play("credits_menu_anim")

func _on_credits_back_button_pressed() -> void:
	$AnimationPlayer.play_backwards("credits_menu_anim")

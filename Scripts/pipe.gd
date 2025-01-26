extends Area2D

signal _on_player_win

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		_on_player_win.emit()
		
		var passLevelMenu = get_tree().get_first_node_in_group("PassLevelMenu")
		passLevelMenu.disableNextLevelButton = false
		passLevelMenu.visible = true
		
		

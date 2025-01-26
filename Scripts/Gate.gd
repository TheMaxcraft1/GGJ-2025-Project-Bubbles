extends StaticBody2D


var isOpened: bool = false

@export var CloseSpeedScale = 1.0


func openGate():
	$AnimationPlayer.speed_scale = 1
	$AnimationPlayer.play("GateOpenClose")
	
func closeGate():
	$AnimationPlayer.speed_scale = CloseSpeedScale
	$AnimationPlayer.play_backwards("GateOpenClose")

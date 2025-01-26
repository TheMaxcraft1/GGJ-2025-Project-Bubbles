extends StaticBody2D


var isOpened: bool = false

func openGate():
	$AnimationPlayer.play("GateOpenClose")
	
func closeGate():
	$AnimationPlayer.play_backwards("GateOpenClose")

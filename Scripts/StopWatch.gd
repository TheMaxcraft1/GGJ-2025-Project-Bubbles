extends Node
class_name StopWatch

var time = 0.0
var stopped: bool = false
var start: bool = false

func _ready() -> void:
	await get_tree().create_timer(0.5).timeout
	start = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if stopped:
		return
	if start:
		time += delta
	
	updateStopwatchLabel()
	
func reset():
	time = 0.0

func updateStopwatchLabel():
	$StopWatchLabel.text = timeToString()
	
func timeToString():
	var sec = fmod(time, 60)
	var min = time/60
	var formatString = "%02d : %02d"
	var actualString = formatString % [min, sec]
	return actualString

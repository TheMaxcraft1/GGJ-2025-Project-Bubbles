extends Control

var stars: int
@export var nextLevel : PackedScene

func _ready() -> void:
	$HBoxContainer/LvlButton.level = nextLevel

func timeToString(time: float):
	var sec = fmod(time, 60)
	var min = time/60
	var formatString = "%02d : %02d"
	var actualString = formatString % [min, sec]
	return actualString

func setStars(stars: int):
	if stars == 1:
		$StarContainer/Star1/TextureRect.visible = false
		$StarContainer/Star1/TextureRect2.visible = true
		
		$StarContainer/Star2/TextureRect.visible = true
		$StarContainer/Star2/TextureRect2.visible = false
		
		$StarContainer/Star3/TextureRect.visible = true
		$StarContainer/Star3/TextureRect2.visible = false
	
	elif stars == 2:
		$StarContainer/Star1/TextureRect.visible = false
		$StarContainer/Star1/TextureRect2.visible = true
		
		$StarContainer/Star2/TextureRect.visible = false
		$StarContainer/Star2/TextureRect2.visible = true
		
		$StarContainer/Star3/TextureRect.visible = true
		$StarContainer/Star3/TextureRect2.visible = false
	else:
		$StarContainer/Star1/TextureRect.visible = false
		$StarContainer/Star1/TextureRect2.visible = true
		
		$StarContainer/Star2/TextureRect.visible = false
		$StarContainer/Star2/TextureRect2.visible = true
		
		$StarContainer/Star3/TextureRect.visible = false
		$StarContainer/Star3/TextureRect2.visible = true
		

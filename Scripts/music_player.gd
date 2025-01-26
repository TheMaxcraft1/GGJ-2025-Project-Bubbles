extends AudioStreamPlayer2D

@export var MenuMusic: AudioStream
@export var LevelMusic: AudioStream

func setLevelMusic():
	stop()
	stream = LevelMusic
	play()

func setMenuMusic():
	stop()
	stream = MenuMusic
	play()

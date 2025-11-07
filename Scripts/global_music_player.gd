extends Node2D

# find the audio player child
@onready var audio_player = $MusicPlayer

# preload all songs
var main_menu_theme = preload("res://assets/Sounds/Intro.wav")


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	play_music("main_menu")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func stop_music() -> void:
	if audio_player.is_playing():
		audio_player.stop()

func play_music(song) -> void:
	# stop current audio that is playing
	stop_music()
		
	# find the new audio to be played
	match song:
		"main_menu":
			audio_player.stream = main_menu_theme
		_:
			printerr("UNKNOWN SONG: " + song + ". PLEASE CHECK FOR CORRECT SONG NAMES.")
			return
			
	audio_player.play()

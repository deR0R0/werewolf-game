extends Node2D

# find the audio player child
@onready var audio_player = $MusicPlayer

var sound_stopped = false

# preload all songs
var music_list = {
	"main_menu": preload("res://assets/sounds/main_menu_theme.wav"),
	"interrogation": preload("res://assets/sounds/interrogation_theme.mp3"),
	"cutscene": preload("res://assets/sounds/cutscene_theme.mp3"),
	"dramatic": preload("res://assets/sounds/dramatic_theme.mp3")
}


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print(audio_player)
	play_music("main_menu")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if !audio_player.playing and !sound_stopped:
		audio_player.play()
	
func stop_music() -> void:
	audio_player.stop()
	sound_stopped = true

func play_music(song) -> void:
	# stop current audio that is playing
	stop_music()
		
	# if audio doesn't exist in directory
	if !music_list.has(song):
		printerr("UNKNOWN SONG ID: " + song)
		return
		
	audio_player.stream = music_list[song]
	audio_player.play()
	
	sound_stopped = false
			
	audio_player.play()

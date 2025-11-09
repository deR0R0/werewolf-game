extends Node2D

# find the audio player child
@onready var audio_player = $MusicPlayer

# preload all songs
var music_list = {
	"main_menu": preload("res://Assets/Sounds/main_menu_theme.wav"),
	"interrogation": preload("res://Assets/Sounds/interrogation_theme.mp3"),
	"cutscene": preload("res://Assets/Sounds/cutscene_theme.mp3"),
	"dramatic": preload("res://Assets/Sounds/dramatic_theme.mp3")
}


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	play_music("main_menu")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if !audio_player.playing:
		audio_player.play()
	
func stop_music() -> void:
	if audio_player.is_playing():
		audio_player.stop()

func play_music(song) -> void:
	# stop current audio that is playing
	stop_music()
		
	# if audio doesn't exist in directory
	if !music_list.has(song):
		printerr("UNKNOWN SONG ID: " + song)
		return
		
	audio_player.stream = music_list[song]
	audio_player.play()
			
	audio_player.play()

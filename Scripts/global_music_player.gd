extends Node2D

# find the audio player child
@onready var audio_player = $MusicPlayer

# preload all songs
var music_list = {
	"main_menu": preload("res://assets/Sounds/Intro.wav"),
	"interrogation": preload("res://assets/Sounds/interrogation_track.mp3")
}


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	audio_player.connect("finished", Callable(self, "_on_music_finish").bind(audio_player))
	play_music("main_menu")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _on_music_finish() -> void:
	audio_player.stream_paused = false
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

extends Node2D

@onready var effect_player = $SoundEffectPlayer

var sounds = {
	"hover": preload("res://assets/sounds/sfx/hover_sfx.wav"),
	"door_shut": preload("res://assets/sounds/sfx/door_shut_sfx.mp3"),
	"select": preload("res://assets/sounds/sfx/selecting_sfx.wav"),
	"keyboard": preload("res://assets/sounds/sfx/keyboard_sfx.mp3"),
	"dramatic_chord": preload("res://assets/sounds/sfx/dramatic_chord.mp3"),
	"knock": preload("res://assets/sounds/sfx/knocking.mp3")
}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func stop_sound() -> void:
	if effect_player.is_playing():
		effect_player.stop()

func play_sound(sound) -> void:
	stop_sound()
	
	if !sounds.has(sound):
		printerr("UNKNOWN SOUND ID: " + sound)
		return
		
	effect_player.stream = sounds[sound]
	effect_player.play()

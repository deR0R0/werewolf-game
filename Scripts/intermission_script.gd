extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	await get_tree().create_timer(4.0).timeout
	GlobalMusicPlayer.play_music("interrogation")
	get_tree().change_scene_to_file("res://scenes/Lineup.tscn")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	await get_tree().create_timer(4.0).timeout
	GlobalMusicPlayer.play_music("interrogation")
	if Global.persuasion_stat + Global.intimidation_stat + Global.deception_stat == 0: # condition for if player hasn't chosen stats yet
		get_tree().change_scene_to_file("res://Scenes/stat_allocation.tscn")
	else:
		get_tree().change_scene_to_file("res://scenes/Lineup.tscn")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

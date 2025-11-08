extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_persuasion_up_button_down():
	if Global.allocatable_points > 0 and Global.persuasion_stat < 5:
		Global.persuasion_stat = Global.persuasion_stat + 1
		Global.allocatable_points = Global.allocatable_points - 1
		print(Global.persuasion_stat)
		print(Global.allocatable_points)

func _on_deception_up_button_down():
	if Global.allocatable_points > 0 and Global.deception_stat < 5:
		Global.deception_stat = Global.deception_stat + 1
		Global.allocatable_points = Global.allocatable_points - 1
		print(Global.deception_stat)
		print(Global.allocatable_points)


func _on_interrogation_up_button_down():
	if Global.allocatable_points > 0 and Global.intimidation_stat < 5:
		Global.intimidation_stat = Global.intimidation_stat + 1
		Global.allocatable_points = Global.allocatable_points - 1
		print(Global.intimidation_stat)
		print(Global.allocatable_points)




func _on_persuasion_down_button_down():
	if Global.allocatable_points < 9 and Global.persuasion_stat > 0:
		Global.persuasion_stat = Global.persuasion_stat - 1
		Global.allocatable_points = Global.allocatable_points + 1
		print(Global.persuasion_stat)
		print(Global.allocatable_points)

func _on_deception_down_button_down():
	if Global.allocatable_points < 9 and Global.deception_stat > 0:
		Global.deception_stat = Global.deception_stat - 1
		Global.allocatable_points = Global.allocatable_points + 1
		print(Global.deception_stat)
		print(Global.allocatable_points)

func _on_interrogation_down_button_down():
	if Global.allocatable_points < 9 and Global.intimidation_stat > 0:
		Global.intimidation_stat = Global.intimidation_stat - 1
		Global.allocatable_points = Global.allocatable_points + 1
		print(Global.intimidation_stat)
		print(Global.allocatable_points)


func _on_continue_button_down():
	Global.Stats_selected = true
	get_tree().change_scene_to_file("res://scenes/Lineup.tscn")

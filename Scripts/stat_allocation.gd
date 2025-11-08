extends Node2D

@onready var bars = [$PersuasionBar/BarIndicator, $IntimidationBar/BarIndicator, $DeceptionBar/BarIndicator]

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
	
func _update_bars():
	bars[0].texture = load("res://Assets/Stat_Allocation/bar-" + str(Global.persuasion_stat) + ".png")
	bars[1].texture = load("res://Assets/Stat_Allocation/bar-" + str(Global.intimidation_stat) + ".png")
	bars[2].texture = load("res://Assets/Stat_Allocation/bar-" + str(Global.deception_stat) + ".png")
	
	
func _increase_values(stat, amount):
	if Global[stat + "_stat"] >= 5:
		return # maxed out?
		
	if Global.allocatable_points <= 0:
		return # no more allocated points
		
	Global[stat + "_stat"] += amount
	Global.allocatable_points -= amount
	
	print("INCREASED ", stat, " STAT. CURRENT: ", str(Global[stat + "_stat"]), " ALLOCATED: ", str(Global.allocatable_points)) # debug
	
	_update_bars()
	
func _decrease_values(stat, amount):
	if Global[stat + "_stat"] <= 0:
		return # min'd out?
		
	Global[stat + "_stat"] -= amount
	Global.allocatable_points += amount
	
	print("DECREASED ", stat, " STAT. CURRENT: ", str(Global[stat + "_stat"]), " ALLOCATED: ", str(Global.allocatable_points)) # debug
	
	_update_bars()
	
func _on_persuasion_increase_pressed():
	_increase_values("persuasion", 1)

func _on_persuasion_decrease_pressed() -> void:
	_decrease_values("persuasion", 1)
	
func _on_intimidation_increase_pressed() -> void:
	_increase_values("intimidation", 1)
	
func _on_intimidation_decrease_pressed() -> void:
	_decrease_values("intimidation", 1)
	
func _on_deception_increase_pressed() -> void:
	_increase_values("deception", 1)
	
func _on_deception_decrease_pressed() -> void:
	_decrease_values("deception", 1)

func _on_continue_button_down():
	Global.Stats_selected = true
	get_tree().change_scene_to_file("res://scenes/Lineup.tscn")

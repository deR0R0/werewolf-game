extends Node2D

@onready var bars = [$PersuasionBar/BarIndicator, $IntimidationBar/BarIndicator, $DeceptionBar/BarIndicator]

var shown_warning = false

# Called when the node enters the scene tree for the first time.
func _ready():
	_update_bars() # just to fill out the remaintingpoints


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
	
	
func _cannot_do_stupid_dumbass(bar):
	match bar:
		"persuasion":
			bar = bars[0]
		"intimidation":
			bar = bars[1]
		"deception":
			bar = bars[2]
		_:
			printerr("I don't even know how this could happen")
	
	if bar.has_meta("tween") and bar.get_meta("tween").is_valid():
		return
	
	# for when you can't increase/decrease anymore
	var bar_pos = bar.position
	var tween = create_tween()
	bar.set_meta("tween", tween)
	
	tween.tween_property(bar, "position", bar_pos + Vector2(-15, 0), 0.075)
	tween.tween_property(bar, "position", bar_pos + Vector2(15, 0), 0.15)
	tween.tween_property(bar, "position", bar_pos, 0.075)
	
	bar.modulate = Color(1, 0.3, 0.3)
	await get_tree().create_timer(0.2).timeout
	bar.modulate = Color(1, 1, 1)

	
func _update_bars():
	bars[0].texture = load("res://Assets/Stat_Allocation/bar-" + str(Global.persuasion_stat) + ".png")
	bars[1].texture = load("res://Assets/Stat_Allocation/bar-" + str(Global.intimidation_stat) + ".png")
	bars[2].texture = load("res://Assets/Stat_Allocation/bar-" + str(Global.deception_stat) + ".png")
	$RemainingPoints.text = "Remaining Points: " + str(Global.allocatable_points)
	
	
func _increase_values(stat, amount):
	if Global[stat + "_stat"] >= 5:
		_cannot_do_stupid_dumbass(stat)
		return # maxed out?
		
	if Global.allocatable_points <= 0:
		_cannot_do_stupid_dumbass(stat)
		return # no more allocated points
		
	Global[stat + "_stat"] += amount
	Global.allocatable_points -= amount
	
	print("INCREASED ", stat, " STAT. CURRENT: ", str(Global[stat + "_stat"]), " ALLOCATED: ", str(Global.allocatable_points)) # debug
	
	_update_bars()
	
func _decrease_values(stat, amount):
	if Global[stat + "_stat"] <= 0:
		_cannot_do_stupid_dumbass(stat)
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
	if !shown_warning and Global.allocatable_points > 0:
		$WarningLabel.visible = true
		shown_warning = true
		return
	
	Global.Stats_selected = true
	get_tree().change_scene_to_file("res://scenes/Lineup.tscn")

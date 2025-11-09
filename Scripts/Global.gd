extends Node

# enums KEEP AT TOP OF FILE.
enum Character {
	MARG = 1,  # margaret = 1
	ALAN,      # alan = 2
	SELE,      # sele = 3
	THEO       # theo = 4
}

# current round

var CURRENTROUND = 1

# Current person you are talking to

var CurrentSuspect = ""
var PlayerSuspect = ""

# Are the rounds over?

var round_overs = {
	"r1": {
		"marg": {
			"over": false,
			"ran": false,
		},
		"alan": {
			"over": false,
			"ran": false
		},
		"sele": {
			"over": false,
			"ran": false
		},
		"theo": {
			"over": false,
			"ran": false
		}
	},
	"r2": {
		"marg": {
			"over": false,
			"ran": false,
		},
		"alan": {
			"over": false,
			"ran": false
		},
		"sele": {
			"over": false,
			"ran": false
		},
		"theo": {
			"over": false,
			"ran": false
		}
	}
}

var Marg_R1_Over = false
var Marg_R2_Over = false
var Marg_R1_Ran = false
var Marg_R2_Ran = false

var Alan_R1_Over = false
var Alan_R2_Over = false
var Alan_R1_Ran = false
var Alan_R2_Ran = false

var Selene_R1_Over = false
var Selene_R2_Over = false
var Selene_R1_Ran = false
var Selene_R2_Ran = false

var Theo_R1_Over = false
var Theo_R2_Over = false
var Theo_R1_Ran = false
var Theo_R2_Ran = false

var intermission_switched_into = false
var second_interrogation = false
var interrogation_one_triggered = false

# Werewolf

var werewolf: int = randi_range(1, 4)

# Double Route Variables

var margaret_intimidation: bool = false
var margaret_persuasion: bool = false

var theodore_deception: bool = true

# dice roll values
var roll_checks = {
	"marg": {
		"persuasion": 15,
		"intimidation": 10,
		"deception": 13
	},
	"alan": {
		"persuasion": 8,
		"intimidation": 12,
		"deception": 17
	},
	"sele": {
		"persuasion": 10,
		"intimidation": 11,
		"deception": 16
	},
	"theo": {
		"persuasion": 14,
		"intimidation": 8,
		"deception": 16
	}
}

# Stat allocations

var persuasion_stat = 0
var deception_stat = 0
var intimidation_stat = 0

var allocatable_points = 9

var Stats_selected = false

var stats_completely_selected = false

# Dice Rolling
var dice_rolls = {
	"marg": {
		"roll_r1_persuasion": randi_range(1, 20),
		"roll_r1_deception": randi_range(1, 20),
		"roll_r1_intimidation": randi_range(1, 20),
		
		"roll_r2_persuasion": randi_range(1, 20),
		"roll_r2_deception": randi_range(1, 20),
		"roll_r2_intimidation": randi_range(1, 20),
	},
	"theo": {
		"roll_r1_persuasion": randi_range(1, 20),
		"roll_r1_deception": randi_range(1, 20),
		"roll_r1_intimidation": randi_range(1, 20),
		
		"roll_r2_persuasion": randi_range(1, 20),
		"roll_r2_deception": randi_range(1, 20),
		"roll_r2_intimidation": randi_range(1, 20),
	},
	"sele": {
		"roll_r1_persuasion": randi_range(1, 20),
		"roll_r1_deception": randi_range(1, 20),
		"roll_r1_intimidation": randi_range(1, 20),
		
		"roll_r2_persuasion": randi_range(1, 20),
		"roll_r2_deception": randi_range(1, 20),
		"roll_r2_intimidation": randi_range(1, 20),
	},
	"alan": {
		"roll_r1_persuasion": randi_range(1, 20),
		"roll_r1_deception": randi_range(1, 20),
		"roll_r1_intimidation": randi_range(1, 20),
		
		"roll_r2_persuasion": randi_range(1, 20),
		"roll_r2_deception": randi_range(1, 20),
		"roll_r2_intimidation": randi_range(1, 20),
	}
}

func _process(_delta):
	if Stats_selected == true:
		print("stats go wheee")
		print(Global.dice_rolls.theo.roll_r1_persuasion)
		Global.dice_rolls.marg.roll_r1_persuasion += persuasion_stat
		Global.dice_rolls.alan.roll_r1_persuasion += persuasion_stat
		Global.dice_rolls.sele.roll_r1_persuasion += persuasion_stat
		Global.dice_rolls.theo.roll_r1_persuasion += persuasion_stat
		print(Global.dice_rolls.theo.roll_r1_persuasion)

		Global.dice_rolls.marg.roll_r2_persuasion += persuasion_stat
		Global.dice_rolls.alan.roll_r2_persuasion += persuasion_stat
		Global.dice_rolls.sele.roll_r2_persuasion += persuasion_stat
		Global.dice_rolls.theo.roll_r2_persuasion += persuasion_stat
		
		
		Global.dice_rolls.marg.roll_r1_deception += deception_stat
		Global.dice_rolls.alan.roll_r1_deception += deception_stat
		Global.dice_rolls.sele.roll_r1_deception += deception_stat
		Global.dice_rolls.theo.roll_r1_deception += deception_stat
		
		Global.dice_rolls.marg.roll_r2_deception += deception_stat
		Global.dice_rolls.alan.roll_r2_deception += deception_stat
		Global.dice_rolls.sele.roll_r2_deception += deception_stat
		Global.dice_rolls.theo.roll_r2_deception += deception_stat
		
		Global.dice_rolls.marg.roll_r1_intimidation += intimidation_stat
		Global.dice_rolls.alan.roll_r1_intimidation += intimidation_stat
		Global.dice_rolls.sele.roll_r1_intimidation += intimidation_stat
		Global.dice_rolls.theo.roll_r1_intimidation += intimidation_stat
		
		Global.dice_rolls.marg.roll_r2_intimidation += intimidation_stat
		Global.dice_rolls.alan.roll_r2_intimidation += intimidation_stat
		Global.dice_rolls.sele.roll_r2_intimidation += intimidation_stat
		Global.dice_rolls.theo.roll_r2_intimidation += intimidation_stat
		
		Stats_selected = false

		
	
	# more elegant way to check for whether their interrogation is done	
	for char in ["marg", "alan", "sele", "theo"]:
		if round_overs.r1[char].over and round_overs.r1[char].ran:
			print(char + " over")
			round_overs.r1[char].ran = false
			get_tree().change_scene_to_file("res://Scenes/Lineup.tscn")

	if round_overs.r1.marg.over and round_overs.r1.alan.over and round_overs.r1.sele.over and round_overs.r1.theo.over and !intermission_switched_into:
		intermission_switched_into = true
		print(intermission_switched_into)
		CURRENTROUND += 1
		get_tree().change_scene_to_file("res://scenes/intermission.tscn")
		
	elif round_overs.r1.marg.over and round_overs.r1.alan.over and round_overs.r1.sele.over and round_overs.r1.theo.over and intermission_switched_into and second_interrogation:
		print("second time around")
		second_interrogation = false
		
		
		
	for char in ["marg", "alan", "sele", "theo"]:
		if round_overs.r2[char].over and round_overs.r2[char].ran:
			print(char + " over")
			round_overs.r2[char].ran = false
			get_tree().change_scene_to_file("res://Scenes/Lineup.tscn")
	

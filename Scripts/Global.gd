extends Node

# enums KEEP AT TOP OF FILE.
enum Character {
	MARG = 1,  # margaret = 1
	ALAN,      # alan = 2
	SELE,      # sele = 3
	THEO       # theo = 4
}

# Current person you are talking to

var CurrentSuspect = ""

# Are the rounds over?

var round_overs = {
	"r1": {
		"marg": {
			"over": false,
			"ran": false
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
			"ran": false
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

var Marg_R2_Over = false
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

# Werewolf

var werewolf: int = randi_range(1, 4)

# Double Route Variables

var double_routes = {
	"marg": {
		"persuasion": false
	},
	"theo": {
		"deception": true
	}
}

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

# Dice Rolling
var dice_rolls = {
	"marg": {
		"roll_r1": randi_range(1, 20),
		"roll_r2": randi_range(1, 20)
	},
	"theo": {
		"roll_r1": randi_range(1, 20),
		"roll_r2": randi_range(1, 20)
	},
	"sele": {
		"roll_r1": randi_range(1, 20),
		"roll_r2": randi_range(1, 20)
	},
	"alan": {
		"roll_r1": randi_range(1, 20),
		"roll_r2": randi_range(1, 20)
	}
}


func _process(_delta):
	if round_overs.r1.marg.over and round_overs.r1.marg.ran:
		print("marg over")
		round_overs.r1.marg.ran = false
		get_tree().change_scene_to_file("res://Scenes/Lineup.tscn")
		
	if Alan_R1_Over and Alan_R1_Ran:
		print("alan over")
		Alan_R1_Ran = false
		get_tree().change_scene_to_file("res://Scenes/Lineup.tscn")
		
	if Selene_R1_Over and Selene_R1_Ran:
		print("selene over")
		Selene_R1_Ran = false
		get_tree().change_scene_to_file("res://Scenes/Lineup.tscn")
		
	if Theo_R1_Over and Theo_R1_Ran:
		print("theo over")
		Theo_R1_Ran = false
		get_tree().change_scene_to_file("res://Scenes/Lineup.tscn")

	

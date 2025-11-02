extends Node

# enums
enum Character {
	MARG = 1,  # margaret = 1
	ALAN,      # alan = 2
	SELE,      # sele = 3
	THEO       # theo = 4
}


# Werewolf

var werewolf: int = randi_range(1, 4)

# Double Route Variables

var margaret_intimidation: bool = true
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

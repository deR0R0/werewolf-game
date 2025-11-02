extends Node

# Werewolf

var werewolf: int = randi_range(1, 4)
# 1 = Margaret
# 2 = Alan
# 3 = Selene
# 4 = Theodore

# Double Route Variables

var margaret_intimidation: bool = true
var margaret_persuasion: bool = false

var theodore_deception: bool = true

# Dice Rolling
	# Margaret Dice Rolls
var marg_roll_r1: int = randi_range(1, 20)

var marg_roll_r2: int = randi_range(1, 20)

	# Theodore Dice Rolls
var theo_roll_r1: int = randi_range(1, 20)

var theo_roll_r2: int = randi_range(1, 20)

	# Selene Dice Rolls
var sele_roll_r1: int = randi_range(1, 20)

var sele_roll_r2: int = randi_range(1, 20)

	# Alan Dice Rolls
var alan_roll_r1: int = randi_range(1, 20)

var alan_roll_r2: int = randi_range(1, 20)

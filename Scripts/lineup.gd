extends Node2D

@onready var round_label = $RoundLabel
@onready var instruction_label = $InstructionsLabel

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if Global.CURRENTROUND < 3:
		round_label = "Interrogation Round: " + str(Global.CURRENTROUND)
	else:
		round_label = "Decision Round"
		instruction_label = "Choose who you think the werewolf is..."


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

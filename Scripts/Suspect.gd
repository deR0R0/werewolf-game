extends Sprite2D

@onready var R1_Margaret_Dialogue = load("res://dialogues/R1_Margaret_Dialogue.dialogue")


# Called when the node enters the scene tree for the first time.
func _ready():
	DialogueManager.show_dialogue_balloon(R1_Margaret_Dialogue, "start")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

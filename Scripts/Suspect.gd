extends Sprite2D

@onready var R1_Margaret_Dialogue = load("res://Dialogues/R1_Margaret_Dialogue.dialogue")
@onready var R2_Margaret_Dialogue = load("res://Dialogues/R2_Margaret_Dialogue.dialogue")

@onready var R1_Alan_Dialogue = load("res://Dialogues/R1_Alan_Dialogue.dialogue")
@onready var R2_Alan_Dialogue = load("res://Dialogues/R2_Alan_Dialogue.dialogue")

@onready var R1_Selene_Dialogue = load("res://Dialogues/R1_Selene_Dialogue.dialogue")
@onready var R2_Selene_Dialogue = load("res://Dialogues/R2_Selene_Dialogue.dialogue")

@onready var R1_Theodore_Dialogue = load("res://Dialogues/R1_Theodore_Dialogue.dialogue")
@onready var R2_Theodore_Dialogue = load("res://Dialogues/R2_Theodore_Dialogue.dialogue")

@onready var player_box: Sprite2D = get_node("../../PlayerFrame/Protag")

# Called when the node enters the scene tree for the first time.
func _ready():
	DialogueManager.dialogue_ended.connect(_on_dialogue_ended)
	DialogueManager.got_dialogue.connect(_on_dialogue_changed)
	
	if Global.CurrentSuspect == "Margaret" and !Global.intermission_switched_into:
		DialogueManager.show_dialogue_balloon(R1_Margaret_Dialogue, "start")
	elif Global.CurrentSuspect == "Alan" and !Global.intermission_switched_into:
		DialogueManager.show_dialogue_balloon(R1_Alan_Dialogue, "start")
	elif Global.CurrentSuspect == "Selene" and !Global.intermission_switched_into:
		DialogueManager.show_dialogue_balloon(R1_Selene_Dialogue, "start")
	elif Global.CurrentSuspect == "Theodore" and !Global.intermission_switched_into:
		DialogueManager.show_dialogue_balloon(R1_Theodore_Dialogue, "start")	
		
	elif Global.CurrentSuspect == "Margaret":
		DialogueManager.show_dialogue_balloon(R2_Margaret_Dialogue, "start")
	elif Global.CurrentSuspect == "Alan":
		DialogueManager.show_dialogue_balloon(R2_Alan_Dialogue, "start")
	elif Global.CurrentSuspect == "Selene":
		DialogueManager.show_dialogue_balloon(R2_Selene_Dialogue, "start")
	elif Global.CurrentSuspect == "Theodore" and Global.intermission_switched_into:
		DialogueManager.show_dialogue_balloon(R2_Theodore_Dialogue, "start")	
	else:
		return
func _on_dialogue_ended(_resource):
	print("line ended")
	
func _on_dialogue_changed(line: DialogueLine):	
	# parse the tags into a better format
	var tags_dict = parse_tags(line.tags)
	
	# check for no size
	if tags_dict.is_empty():
		# set the fallback sprite
		texture = load("res://assets/" + line.character + "_Sprites/sprite00-" + line.character + ".png")
		return
		
	# check for the sprite tag
	if !tags_dict.has("sprite"):
		return
		
	# check for valid character
	if line.character not in ["Margaret", "Alan", "Selene", "Theodore", "Protag"]:
		print(line.character + " is NOT a valid character. Check dialogue script.")
		return
	
	if line.character != "Protag":
		texture = load("res://assets/" + line.character + "_Sprites/sprite" + tags_dict.get("sprite") + "-" + line.character + ".png")
	else:
		player_box.texture = load("res://assets/" + line.character + "_Sprites/sprite" + tags_dict.get("sprite") + "-" + line.character.to_lower() + "onist.png")

	
func parse_tags(tags: PackedStringArray) -> Dictionary:
	# parse the tags into a key value pair type shi
	var tags_dict = {}
	for tag in tags:
		var tag_parts = tag.split("=")
		if tag_parts.size() == 2:
			tags_dict[tag_parts[0]] = tag_parts[1]
			
	return tags_dict
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

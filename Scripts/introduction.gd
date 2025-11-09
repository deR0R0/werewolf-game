extends Node2D

@onready var door_scene = $DoorScene
@onready var lineup = $Lineup
@onready var protag = $Protag
@onready var text = $LoreText

var current_lineup = 0

func _ready() -> void:
	Engine.time_scale = 5
	# immediately set the opacity of the door scene to 0
	door_scene.self_modulate.a = 0
	protag.self_modulate.a = 0
	# create the tween
	_animations()
	# then start the lore text...
	_text()
	
	
func _change_lineup_texture():
	lineup.texture = load("res://Assets/introduction/introcgs-" + str(current_lineup) + ".png")
	current_lineup += 1

func _text():
	text.text = "[i]There has been a [wave]murder[/wave][/i]"
	await get_tree().create_timer(7).timeout
	text.position = Vector2(0, 0)
	text.text = "[i]Douglass Wilson, a 75 year old man who lived at the edge of town, was found dead by his cleaning staff at 7 A.M.[/i]"
	await get_tree().create_timer(10).timeout
	text.text = "[i]Autopsy reports showed he died around 11pm at night.[/i]"
	await get_tree().create_timer(5).timeout
	text.text = "[i]Strangely enough, reports also show he sustained severe scratches, and died of a bite on the neck. The bite marks had similarities to those of a wolf, but were far too large to be from one.[/i]"
	await get_tree().create_timer(11).timeout
	text.text = "[i][color=black]Police identified four suspects, people who were seen visiting Douglass’s house before he died.[/color][/i]"
	await get_tree().create_timer(13).timeout
	text.text = "[i][color=black]Douglass’s granddaughter, Margaret, a 15 year old high school student living on the other side of town.[/color][/i]"
	text.position = Vector2(580, 224)
	await get_tree().create_timer(7).timeout
	text.text = "[i][color=black]Douglass’s caretaker, Alan, a 36 year old nurse who often visited to check on his health.[/color][/i]"
	await get_tree().create_timer(5).timeout
	text.text = "[i][color=black]Selene, a 22 year old college dropout spotted lurking in the area at late hours for no apparent reason.[/color][/i]"
	text.position = Vector2(600, 124)
	await get_tree().create_timer(5).timeout
	text.text = "[i][color=black]Theodore, a 25 year old archaeology student living on the nearby university campus.[/color][/i]"
	text.position = Vector2(550, 94)
	await get_tree().create_timer(9).timeout
	text.text = "[i][color=black]I’ve been tasked with finding which of the four are the true culprit.[color=black][/i]"
	text.position = Vector2(280, 0)
	await get_tree().create_timer(6).timeout
	text.text = "[i][color=black]I’d be lying if I said I wasn’t nervous. Not only is it incredibly important that I solve this case, but there’s definitely something suspicious going on.[/color][/i]"
	await get_tree().create_timer(5).timeout
	text.text = "[i][color=black]I don’t know if I believe in the supernatural, but I don’t know what other explanation I have for what happened.[/color][/i]"
	await get_tree().create_timer(5).timeout
	text.text = "[i][color=black]Either way, it’s my job to solve the case and catch the killer.[/color][/i]"
	await get_tree().create_timer(10).timeout
	text.text = "[i][color=black]These are the suspects, I guess. They’re quite the… interesting bunch. I guess I should get to work and start interrogating one of them.[/color][/i]"

func _animations():
	var tween = create_tween()
	tween.tween_property(text, "visible_ratio", 1, 3).from(0)
	tween.tween_property(text, "self_modulate:a", 0, 2).from(1).set_delay(2)
	tween.tween_property(door_scene, "self_modulate:a", 1, 3)
	tween.tween_property(text, "self_modulate:a", 1, 0.01).set_delay(2)
	tween.tween_property(text, "visible_ratio", 1, 3).from(0)
	tween.tween_property(text, "visible_ratio", 1, 3).from(0).set_delay(2)
	tween.tween_property(text, "visible_ratio", 1, 5).from(0).set_delay(2)
	tween.tween_property(text, "self_modulate:a", 0, 3).set_delay(2)
	tween.tween_property(door_scene, "self_modulate:a", 0, 3)
	tween.tween_callback(Callable(self, "_change_lineup_texture"))
	tween.tween_property(lineup, "self_modulate:a", 1, 3).from(0)
	tween.tween_property(text, "self_modulate:a", 1, 0.01).set_delay(2)
	tween.tween_property(text, "visible_ratio", 1, 3).from(0)
	tween.tween_interval(2)
	tween.tween_callback(Callable(self, "_change_lineup_texture"))
	tween.parallel().tween_property(lineup, "scale", Vector2(.6, .6), 1.0)
	tween.parallel().tween_property(lineup, "position", Vector2(1100, 424), 1.0)
	tween.tween_interval(5)
	tween.tween_callback(Callable(self, "_change_lineup_texture"))
	tween.parallel().tween_property(lineup, "position", Vector2(700, 524), 1.0)
	tween.tween_interval(5)
	tween.tween_callback(Callable(self, "_change_lineup_texture"))
	tween.parallel().tween_property(lineup, "position", Vector2(200, 424), 1.0)
	tween.tween_interval(5)
	tween.tween_callback(Callable(self, "_change_lineup_texture"))
	tween.parallel().tween_property(lineup, "position", Vector2(0, 500), 1.0)
	tween.tween_interval(5)
	tween.tween_property(text, "self_modulate:a", 0, 1.0)
	tween.parallel().tween_property(lineup, "scale", Vector2(.3, .3), 1.0)
	tween.parallel().tween_property(lineup, "position", Vector2(576, 324), 1.0)
	tween.tween_interval(1)
	tween.tween_property(lineup, "self_modulate:a", 0, 3)
	tween.tween_property(protag, "self_modulate:a", 1, 3)
	tween.tween_interval(1)
	tween.tween_property(text, "self_modulate:a", 1, 0.001)
	tween.tween_property(text, "visible_ratio", 1, 3).from(0)
	tween.tween_property(text, "visible_ratio", 1, 3).from(0).set_delay(2)
	tween.tween_property(text, "visible_ratio", 1, 3).from(0).set_delay(2)
	# transition back to the lineup scene
	tween.tween_interval(1)
	tween.tween_property(text, "self_modulate:a", 0, 2).from(1)
	tween.tween_property(protag, "self_modulate:a", 0, 3).from(1)
	tween.tween_property(lineup, "self_modulate:a", 1, 3).from(0)
	# show the text for the stupid thing
	tween.tween_property(text, "self_modulate:a", 1, 2)
	# change scene
	await tween.finished
	get_tree().change_scene_to_file("res://Scenes/Lineup.tscn")

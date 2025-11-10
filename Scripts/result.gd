extends Node2D

var won = false

var current_frame = 0


@onready var black_background = $BlackBackground
@onready var bg = $Background
@onready var jailed = $Jailed
@onready var protag = $ProtagItsYou
@onready var text = $LoreText
@onready var quit = $ExitButton


func determine_win() -> void:
	won = Global.werewolf == Global.PlayerSuspect

func create_text():
	text.text = ""
	text.position = Vector2(0, 0)
	await get_tree().create_timer(3).timeout
	text.text = "[i][color=black]I identify " + ["Margaret", "Alan", "Selene", "Theodore"][Global.PlayerSuspect - 1] + " as responsible for the murder of Douglass Wilson.[/color][/i]"
	await get_tree().create_timer(7).timeout
	text.text = ""
	await get_tree().create_timer(2).timeout
	text.text = "[i]They’re arrested, and the trial finds them guilty.[/i]"
	await get_tree().create_timer(4).timeout
	text.text = "[i]I hope I made the right choice...[/i]"
	await get_tree().create_timer(6).timeout
	text.text = ""
	await get_tree().create_timer(5).timeout
	
	if won:
		text.text = "[i]A month has gone by. There are no more murders. The town is as quiet as ever. Werewolves have spared this place… for now.[/i]"
		await get_tree().create_timer(5).timeout
		text.text = "[i]I have no idea what’s going to happen after this. Will werewolves infiltrate this place again? What is the government going to do about the Lycanthropy epidemic? One thing at a time, I suppose. At least I got to keep my job.[/i]"
	else:
		text.text = "\"Who could be knocking at this hour?\""

func _set_win_screen():
	bg.texture = load("res://Assets/endings/endcg-goodend.png")
	
func _frame_bad_ending():
	bg.texture = load("res://Assets/endings/endcg-badend-0" + str(current_frame) + ".png")
	current_frame += 1

func create_animations():
	var tween = create_tween()
	tween.tween_property(protag, "self_modulate:a", 1, 2).from(0)
	tween.tween_property(text, "self_modulate:a", 1, 1).from(0)
	tween.tween_property(text, "visible_ratio", 1, 3).from(0) # i identify
	tween.tween_interval(2)
	# fade out protag
	# fade out text
	# fade in jailed scene
	tween.parallel().tween_property(protag, "self_modulate:a", 0, 2).from(1)
	tween.parallel().tween_property(text, "self_modulate:a", 0, 2).from(1)
	tween.parallel().tween_property(jailed, "self_modulate:a", 1, 2).from(0).set_delay(1)
	tween.tween_interval(3)
	
	# fade in text
	tween.tween_property(text, "self_modulate:a", 1, 0.0001).from(0)
	tween.tween_property(text, "visible_ratio", 1, 2).from(0) # arrested
	tween.tween_interval(2)
	tween.tween_property(text, "visible_ratio", 1, 2).from(0) # i hope
	tween.tween_interval(2)
	
	tween.parallel().tween_property(jailed, "self_modulate:a", 0, 2).from(1)
	tween.parallel().tween_property(text, "self_modulate:a", 0, 2).from(0)
	tween.tween_interval(1)

	# show the full moon thing
	tween.tween_property(bg, "self_modulate:a", 1, 2).from(0)
	tween.tween_interval(3)
	# if we won, show the win screen. crazy
	if won:
		tween.tween_callback(Callable(self, "_set_win_screen"))
		tween.tween_property(text, "self_modulate:a", 1, 1).from(0)
		tween.tween_property(text, "visible_ratio", 1, 3).from(0)
		tween.tween_interval(2)
		tween.tween_property(text, "visible_ratio", 1, 5).from(0)
	else:
		tween.tween_callback(Callable(self, "_frame_bad_ending"))
		tween.tween_property(text, "self_modulate:a", 1, 1).from(0)
		tween.tween_property(text, "visible_ratio", 1, 2).from(0)
		tween.tween_property(text, "self_modulate:a", 0, 1).from(1)
		for x in range(6):
			tween.tween_callback(Callable(self, "_frame_bad_ending"))
			tween.tween_interval(1)
		tween.tween_property(bg, "self_modulate:a", 0, 0.0001).from(1)
		tween.tween_interval(3)
		
	await tween.finished
	quit.visible = true
	

	

func _ready() -> void:
	# determine whether the player won or not
	determine_win()
	
	# stop all music
	GlobalMusicPlayer.stop_music()

	# hide all the stuff
	bg.self_modulate.a = 0
	jailed.self_modulate.a = 0
	protag.self_modulate.a = 0
	text.self_modulate.a = 0
	
	# set the textures for jailed
	var suspect = ["marg", "alan", "sele", "theo"][Global.PlayerSuspect - 1]
	jailed.texture = load("res://Assets/endings/endcg-jail-" + suspect + ".png")

	# call the animation stuff
	create_animations()
	create_text()


func _exit() -> void:
	get_tree().quit()

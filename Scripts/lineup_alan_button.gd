extends TextureButton

@onready var Shadow = $"../ShadowLineupAlan"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	z_index = 4
	
	if texture_normal:
		# Get the image from the texture normal
		var image = texture_normal.get_image()
		# Create the BitMap
		var bitmap = BitMap.new()
		# Fill it from the image alpha
		bitmap.create_from_image_alpha(image)
		# Assign it to the mask
		texture_click_mask = bitmap

	if Global.round_overs.r1.alan.over and !Global.intermission_switched_into:
		visible = false
		Shadow.visible = false

	if Global.intermission_switched_into and !Global.interrogation_one_triggered:
		visible = true
		Shadow.visible = true
		await get_tree().create_timer(0.2).timeout
		Global.interrogation_one_triggered = true

func _on_mouse_entered():
	z_index = 10
	GlobalSoundPlayer.play_sound("hover")
	
func _on_mouse_exited():
	z_index = 4


func _on_button_down():
	Global.CurrentSuspect = "Alan"
	if Global.CURRENTROUND >= 3:
		Global.PlayerSuspect = "Alan"
		print("PLAYER SELECTED ALAN AS THE WEREWOLF!")
	else:
		get_tree().change_scene_to_file("res://Scenes/Game_Scene.tscn")
	
func _process(_delta):
	pass

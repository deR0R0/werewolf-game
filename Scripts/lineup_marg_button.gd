extends TextureButton

@onready var Shadow = $"../ShadowLineupMarg"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	z_index = 5
	
	if texture_normal:
		# Get the image from the texture normal
		var image = texture_normal.get_image()
		# Create the BitMap
		var bitmap = BitMap.new()
		# Fill it from the image alpha
		bitmap.create_from_image_alpha(image)
		# Assign it to the mask
		texture_click_mask = bitmap


func _on_mouse_entered():
	z_index = 10
	GlobalSoundPlayer.play_sound("hover")
	
func _on_mouse_exited():
	z_index = 5


func _on_button_down():
	Global.CurrentSuspect = "Margaret"
	print(Global.CurrentSuspect)
	get_tree().change_scene_to_file("res://Scenes/Game_Scene.tscn")
	
func _process(_delta):
	if Global.round_overs.r1.marg.over:
		Global.round_overs.r1.marg.over = false
		visible = false
		Shadow.visible = false

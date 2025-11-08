extends Node2D

@onready var Left = $IntermissionProtag00
@onready var Right = $IntermissionProtag01
@onready var Center = $IntermissionProtag02
@onready var Black = $Black


# Called when the node enters the scene tree for the first time.
func _ready():
	
	print("intermission entered")
	
	Black.visible = true
	Left.visible = false
	Center.visible = false
	Right.visible = false
	await get_tree().create_timer(3.0).timeout
	
	Black.visible = false
	Left.visible = true
	Center.visible = false
	Right.visible = false
	await get_tree().create_timer(3.0).timeout
	
	Black.visible = false
	Left.visible = false
	Center.visible = false
	Right.visible = true
	await get_tree().create_timer(3.0).timeout
	
	Black.visible = false
	Left.visible = false
	Center.visible = true
	Right.visible = false
	await get_tree().create_timer(3.0).timeout
	
	get_tree().change_scene_to_file("res://scenes/Lineup.tscn")
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

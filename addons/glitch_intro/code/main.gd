@tool
extends Control

var glitch_scene : PackedScene = preload("res://addons/glitch_intro/scenes/glitch_intro_scene.tscn")

func _ready() -> void:
	var glitch : Control = glitch_scene.instantiate()
	glitch.set_anchors_preset(Control.PRESET_FULL_RECT)
	add_child(glitch)

@tool

## This script wraps the intro scene, exposes the intro over signal and play function.
extends Control
class_name GlitchIntro

## Signals when the intro is over.
signal intro_over

## The intro scene.
var glitch_scene : PackedScene = preload("res://addons/glitch_intro/scenes/glitch_intro_scene.tscn")

## Inner glitch scene.
var glitch = null

## Instantiates the intro scene, adds it as a child and connects the exposed signal.
func _ready() -> void:
	#var glitch : GlitchIntroInner = glitch_scene.instantiate()
	var new_glitch = glitch_scene.instantiate() # NOTE: use duck-typing in order to reduce interface footprint.
	glitch = new_glitch
	var emit_intro_over = func() -> void:
		intro_over.emit()
	new_glitch.intro_over.connect(emit_intro_over)
	new_glitch.set_anchors_preset(Control.PRESET_FULL_RECT)
	add_child(new_glitch)

func play() -> void:
	if glitch != null:
		glitch.play()

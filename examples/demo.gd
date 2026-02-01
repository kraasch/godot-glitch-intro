extends Control

@onready var glitch: GlitchIntro = %glitch
@onready var button: Button = %button

var menu_scene : PackedScene = preload("res://menu.tscn")

func load_menu() -> void:
	get_tree().change_scene_to_packed(menu_scene)

func _on_button_pressed() -> void:
	%button.visible = false
	glitch.intro_over.connect(load_menu)
	glitch.play()

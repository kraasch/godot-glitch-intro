@tool
extends EditorPlugin

var plugin_type : String = "GlitchIntroNode"
var plugin_base : String = "Control"
var plugin_script : Resource = preload("res://addons/glitch_intro/code/main.gd")
var plugin_icon : Resource = preload("res://addons/glitch_intro/assets/glitch_icon.png")


func _enable_plugin() -> void:
	pass

func _disable_plugin() -> void:
	pass

func _enter_tree() -> void:
	add_custom_type(plugin_type, plugin_base, plugin_script, plugin_icon)

func _exit_tree() -> void:
	remove_custom_type(plugin_type)

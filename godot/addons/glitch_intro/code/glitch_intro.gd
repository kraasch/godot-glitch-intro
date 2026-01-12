@tool
extends EditorPlugin

const plugin_type : String = "GodotGlitchIntro"
const plugin_node : String = "Node2D"

var plugin_script : Resource = Resource.new()
var plugin_icon : Resource = preload("res://addons/glitch-intro/assets/glitch_icon.png")

func _enable_plugin() -> void:
	pass

func _disable_plugin() -> void:
	pass

func _enter_tree() -> void:
	add_custom_type(plugin_type, plugin_node, plugin_script, plugin_icon)

func _exit_tree() -> void:
	remove_custom_type(plugin_type)

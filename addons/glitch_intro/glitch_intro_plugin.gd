@tool
extends EditorPlugin

## The plugin node's name.
var plugin_type : String = "GlitchIntroNode"

## The base type of the plugin.
var plugin_base : String = "Control"

## The location of the plugin's main script.
var plugin_script : Resource = preload("res://addons/glitch_intro/code/main.gd")

## The location of the plugin's icon.
var plugin_icon : Resource = preload("res://addons/glitch_intro/assets/glitch_icon.png")

# NOTE: comment in, if needed.
#func _enable_plugin() -> void:
#	pass
#
#func _disable_plugin() -> void:
#	#pass

## Called after add_child().
func _enter_tree() -> void:
	add_custom_type(plugin_type, plugin_base, plugin_script, plugin_icon)

## Called when node is removed from tree.
func _exit_tree() -> void:
	remove_custom_type(plugin_type)

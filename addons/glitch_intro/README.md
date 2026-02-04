
# glitch intro

 A lean glitch intro node plugin for Godot.
 
  - AssetLib: [Godot Glitch Intro (#4667)](https://godotengine.org/asset-library/asset/4667)
  - Github: [github.com/kraasch/godot-glitch-intro](https://github.com/kraasch/godot-glitch-intro)

## demo

<!-- ![demo_img_01](./info/screenshots/shot.png) -->
![demo_gif_01](./info/screenshots/demo.gif)

## code example

A little demo scene can be found in the `./examples/` sub-folder.

After downloading the plugin with the AssetLib tab or manually
and after enabling the plugin under `Project>Project Settings>Plugins`
the node `GlitchIntro` will be available when adding a new node with the
new node dialog (e.g. after having the Scene tab open and pressing **ctrl+a**).

For invoking the plugin call the `play()` function and for loading the next
scene connect to the `intro_over` signal, as both shown below.

```gdscript
extends Control

@onready var glitch: GlitchIntro = %glitch

var menu_scene : PackedScene = preload("res://menu.tscn")

func load_menu() -> void:
	get_tree().change_scene_to_packed(menu_scene)

func _on_button_pressed() -> void:
	glitch.intro_over.connect(load_menu)
	glitch.play()
```

## credits

resources used:

  - beep noise: https://freesound.org/people/leviclaassen/sounds/107786/ -- leviclaassen, October 31st, 2010.
  - radio noise: https://freesound.org/people/ERH/sounds/30331/ -- ERH, February 2nd, 2007.
  - glitch shader: https://godotshaders.com/shader/glitch-effect-shader/ -- arlez80, March 15, 2021.


@tool
extends Control

#################################
### SIGNALS #####################
#################################

signal intro_over

#################################
### CONSTANTS ###################
#################################

const global_wait : float = 2.0

#################################
### SUB-NODES ###################
#################################

@onready var image: TextureRect = %image
@onready var overlay: ColorRect = %overlay
@onready var tv_player: AudioStreamPlayer = %tv_player
@onready var radio_player: AudioStreamPlayer = %radio_player

#################################
### VARIABLES ###################
#################################

var __timers : Array[Timer] = []
var __was_started : bool = false

#################################
### INTERNAL FUNCTIONS ##########
#################################

func _ready() -> void:
	replay()

func _process(delta: float) -> void:
	if not __was_started:
		for t in __timers:
			t.start()
		__was_started = true

#################################
### PUBLIC FUNCTIONS ############
#################################

func replay() -> void:
	# NOTE: Maybe do a check here at some point.
	#if is_inside_tree():
	#if is_part_of_edited_scene():
	__was_started = false
	__get_ready()

#################################
### PRIVATE FUNCTIONS ###########
#################################

func __setup_timer(time : float, f : Callable) -> void:
	var timer : Timer = Timer.new()
	timer.one_shot = true
	timer.wait_time = time
	if f != null:
		timer.timeout.connect(f)
	add_child(timer)
	__timers.push_back(timer)

func __turn_off() -> void:
	# reset visuals.
	image.modulate = Color()
	overlay.visible = false
	tv_player.stop()
	radio_player.stop()
	# emit that intro is over.
	intro_over.emit()

func __get_ready() -> void:
	# initial wait.
	var glow = func () -> void:
		var tween : Tween = get_tree().create_tween()
		tween.tween_property(image, "modulate", Color(0.5, 0.8, 1.0, 1.0), 0.5)
	__setup_timer(global_wait + 1.0, glow)
	# play radio sound.
	var f_radio = func () -> void:
		radio_player.play()
	__setup_timer(global_wait + 1.0, f_radio)
	# play tv sound.
	var f_tv = func () -> void:
		tv_player.play()
	__setup_timer(global_wait + 2.0, f_tv)
	# activate shader.
	var f_shader = func () -> void:
		overlay.visible = true
	__setup_timer(global_wait + 2.25, f_shader)
	# make dark
	var f_darken = func () -> void:
		image.modulate = Color()
	__setup_timer(global_wait + 2.75, f_darken)
	__setup_timer(global_wait + 2.85, __turn_off)

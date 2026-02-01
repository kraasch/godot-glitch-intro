@tool
extends Control
#class_name GlitchIntroInner # NOTE: reduce interface size.

#################################
### SIGNALS #####################
#################################

## Is emitted when intro is over (connected to by wrapper).
signal intro_over

#################################
### CONSTANTS ###################
#################################

## The initial wait time for the animations to play.
const global_wait : float = 2.0

#################################
### SUB-NODES ###################
#################################

## The inner texture rectangle, used to play fade out effect.
@onready var image: TextureRect = %image

## The inner color rectangle, used to play gitch shader effect.
@onready var overlay: ColorRect = %overlay

## The inner audio stream player to play a TV noise.
@onready var tv_player: AudioStreamPlayer = %tv_player

## The inner audio stream player to play a radio noise.
@onready var radio_player: AudioStreamPlayer = %radio_player

#################################
### VARIABLES ###################
#################################

## Inner array of timers.
var __timers : Array[Timer] = []

## Set to true when intro plays.
var __was_started : bool = false

#################################
### INTERNAL FUNCTIONS ##########
#################################

## The process function.
func _process(_delta: float) -> void:
	__start_timers()

#################################
### PUBLIC FUNCTIONS ############
#################################

## Used to play the intro.
# NOTE: at the moment not used, because not exposed.
func play() -> void:
	# NOTE: Maybe do a check here at some point.
	#if is_inside_tree():
	#if is_part_of_edited_scene():
	__reset_all()
	__was_started = false
	__get_ready()

#################################
### PRIVATE FUNCTIONS ###########
#################################

## Starts all timers.
func __start_timers() -> void:
	if not __was_started:
		for t in __timers:
			t.start()
		__was_started = true

## Used to reset all effects.
# NOTE: at the moment not used, because not exposed.
func __reset_all() -> void:
	#__was_started = false
	__timers = []

## Sets up a timer.
func __setup_timer(time : float, f : Callable) -> void:
	var timer : Timer = Timer.new()
	timer.one_shot = true
	timer.wait_time = time
	if f != null:
		timer.timeout.connect(f)
	add_child(timer)
	__timers.push_back(timer)

## Turns the animation off when over.
func __turn_off() -> void:
	# reset visuals.
	image.modulate = Color()
	overlay.visible = false
	tv_player.stop()
	radio_player.stop()
	# emit that intro is over.
	intro_over.emit()

## Sets up the animation before start.
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

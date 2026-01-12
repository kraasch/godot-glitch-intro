extends Control

const global_wait : float = 0.0

var timers : Array[Timer] = []
var has_played : bool = false

func setup_timer(time : float, f : Callable) -> void:
	var timer : Timer = Timer.new()
	timer.one_shot = true
	timer.wait_time = time
	if f != null:
		timer.timeout.connect(f)
	add_child(timer)
	timers.push_back(timer)

func _ready() -> void:
	# wait 2 sec.
	var nothing = func () -> void:
		pass
	setup_timer(global_wait + 2.0, nothing)
	# play radio sound.
	var radio = func () -> void:
		%radio_player.play()
	setup_timer(global_wait + 1.0, radio)
	# play tv sound.
	var tv = func () -> void:
		%tv_player.play()
	setup_timer(global_wait + 2.0, tv)
	# activate shader.
	var shader = func () -> void:
		%overlay.visible = true
	setup_timer(global_wait + 2.25, shader)
	# activate shader.
	var turnoff = func () -> void:
		%image.modulate = Color()
	setup_timer(global_wait + 2.75, turnoff)

func _process(delta: float) -> void:
	if not has_played:
		for t in timers:
			t.start()
		has_played = true

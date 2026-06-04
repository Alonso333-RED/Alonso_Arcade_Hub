extends Button

var holding := false
var hold_time := 0.0
var required_time := 1.0
var activated := false

func _ready():
	button_down.connect(_on_button_down)
	button_up.connect(_on_button_up)

func _process(delta):
	if holding and not activated:
		hold_time += delta

		if hold_time >= required_time:
			activated = true
			activate()

func _on_button_down():
	holding = true
	hold_time = 0.0
	activated = false

func _on_button_up():
	holding = false
	hold_time = 0.0
	activated = false

func activate():
	get_tree().change_scene_to_file("res://MainMenu/MainMenu.tscn")

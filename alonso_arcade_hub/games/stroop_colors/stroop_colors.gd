extends Control

var r
var g
var b
var current_color

var possible_colors 

@onready var background = $background

func _ready() -> void:
	randomize()

func _on_timer_timeout() -> void:
	r = randi_range(0, 1)
	g = randi_range(0, 1)
	b = randi_range(0, 1)

	background.color = Color(r,g,b,1)

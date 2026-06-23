extends Node2D

var alives = 4

func check():
	alives -= 1
	if alives < 2:
		get_tree().reload_current_scene()

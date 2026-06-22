extends Area2D

@export var speed := 500.0

func _ready():
	pass
	
func _physics_process(delta):
	global_position += Vector2.UP.rotated(global_rotation) * speed * delta

func _on_timer_timeout() -> void:
	queue_free()

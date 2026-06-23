extends CharacterBody2D

@export var speed := 500.0
@export var damage := 1

func _ready():
	velocity = Vector2.UP.rotated(global_rotation) * speed

func _physics_process(delta):
	var collision = move_and_collide(velocity * delta)

	if collision:
		var obj = collision.get_collider()

		if obj.has_method("take_damage") and !obj.dead:
			obj.take_damage(damage)
			queue_free()

		velocity = velocity.bounce(collision.get_normal())
		velocity = velocity.normalized() * speed


func _on_timer_timeout() -> void:
	queue_free()

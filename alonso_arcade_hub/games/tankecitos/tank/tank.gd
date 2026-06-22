extends CharacterBody2D

var max_hp = 1000
var hp = max_hp
var speed = 250

var had_input := false
var can_shoot := true

@export var player: PlayerMetadata
@export var bullet_scene: PackedScene

func _ready():
	$chasis.modulate = player.color
	$turret.modulate = player.color

@warning_ignore("unused_parameter")
func _physics_process(delta):
	var direction = Input.get_vector(
		player.prefix + "_left",
		player.prefix + "_right",
		player.prefix + "_up",
		player.prefix + "_down"
		)
		
	if direction != Vector2.ZERO:
		$chasis.rotation = direction.angle() + deg_to_rad(90)
		$hitbox.rotation = direction.angle() + deg_to_rad(90)
		
	velocity = direction * speed
	move_and_slide()
	
	$turret.rotation += deg_to_rad(45) * delta
	
	var has_input = direction != Vector2.ZERO
	
	if had_input and not has_input:
		shoot()
		
	had_input = has_input
		
	
func shoot():
	if not can_shoot:
		return
		
	can_shoot = false
	
	var bullet = bullet_scene.instantiate()
	
	get_parent().add_child(bullet)
	
	bullet.global_position = $turret/Muzzle.global_position
	bullet.global_rotation = $turret.global_rotation
	
	await get_tree().create_timer(1.0).timeout
	
	can_shoot = true

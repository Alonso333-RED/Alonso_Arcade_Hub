extends CharacterBody2D

var max_hp = 1000
var hp = max_hp
var speed = 250

@export var player: PlayerMetadata
var joystick: VirtualJoystickPlus

@onready var chasis = $chasis
@onready var turret = $turret

func _ready():
	chasis.modulate = player.color
	turret.modulate = player.color
	var ui = get_tree().current_scene.get_node("FourJoysticksUi")
	var joystick_name = "joystick_" + player.prefix

	joystick = ui.find_child(joystick_name, true, false)

@warning_ignore("unused_parameter")
func _physics_process(delta):
	var dir = get_input_direction()
	velocity = dir * speed
	move_and_slide()
	global_position.x = clamp(global_position.x, -950, 950)
	global_position.y = clamp(global_position.y, -450, 450)
	
func get_input_direction() -> Vector2:
	var prefix = player.prefix

	var keyboard_dir = Vector2.ZERO

	if Input.is_action_pressed(prefix + "_right"):
		keyboard_dir.x += 1
	if Input.is_action_pressed(prefix + "_left"):
		keyboard_dir.x -= 1
	if Input.is_action_pressed(prefix + "_down"):
		keyboard_dir.y += 1
	if Input.is_action_pressed(prefix + "_up"):
		keyboard_dir.y -= 1

	var joystick_dir = Vector2.ZERO
	if joystick:
		joystick_dir = joystick.get_value()

	if joystick_dir.length() > 0.1:
		return joystick_dir.normalized()

	return keyboard_dir.normalized()

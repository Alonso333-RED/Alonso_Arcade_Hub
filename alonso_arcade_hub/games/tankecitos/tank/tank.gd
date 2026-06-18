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
	joystick = JoystickUtils.find_joystick_by_player(player)

@warning_ignore("unused_parameter")
func _physics_process(delta):
	var dir = InputUtils.get_movement_vector(player, joystick)

	velocity = dir * speed
	move_and_slide()

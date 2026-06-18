class_name JoystickUtils

static func find_joystick_by_player(player: PlayerMetadata) -> VirtualJoystickPlus:
	var ui = Engine.get_main_loop().current_scene.get_node("FourJoysticksUi")

	if ui == null:
		return null

	var joystick_name = "joystick_" + player.prefix

	return ui.find_child(joystick_name, true, false)

class_name InputUtils

static func get_movement_vector(
	player: PlayerMetadata,
	joystick: VirtualJoystickPlus
) -> Vector2:

	var prefix = player.prefix

	var keyboard_dir := Vector2.ZERO

	if Input.is_action_pressed(prefix + "_right"):
		keyboard_dir.x += 1

	if Input.is_action_pressed(prefix + "_left"):
		keyboard_dir.x -= 1

	if Input.is_action_pressed(prefix + "_down"):
		keyboard_dir.y += 1

	if Input.is_action_pressed(prefix + "_up"):
		keyboard_dir.y -= 1

	if joystick:
		var joystick_dir = joystick.get_value()

		if joystick_dir.length() > 0.1:
			return joystick_dir.normalized()

	return keyboard_dir.normalized()

extends RigidBody3D

@export var acceleration := 20.0
@export var brake_power := 30.0
@export var turn_speed := 2.0
@export var max_speed := 40.0

var current_speed := 0.0

func _physics_process(delta):
	var gas = Input.get_action_strength("ui_up")
	var brake = Input.get_action_strength("ui_down")
	var turn = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")

	# газ
	if gas > 0:
		current_speed = clamp(current_speed + acceleration * delta, -max_speed, max_speed)

	# тормоз
	if brake > 0:
		current_speed = clamp(current_speed - brake_power * delta, -max_speed, max_speed)

	# движение
	var direction = -transform.basis.z * current_speed
	apply_central_force(direction)

	# поворот
	if abs(current_speed) > 1:
		apply_torque(Vector3.UP * turn * turn_speed)

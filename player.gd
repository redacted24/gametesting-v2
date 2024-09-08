extends CharacterBody3D

@export var speed = 14
@export var fall_acceleration = 75
@export var jump_strength = 75

var target_velocity = Vector3.ZERO
var jump_delay = 0.5 # seconds
var jumping = false
var nb_jumps = 0
var delay_count = 0

func _physics_process(delta: float) -> void:
	var direction = Vector3.ZERO
	
	if Input.is_action_pressed('move_up'):
		direction.z -= 1
		direction.x -= 1
	if Input.is_action_pressed('move_down'):
		direction.z += 1
		direction.x += 1
	if Input.is_action_pressed('move_left'):
		direction.x -= 1
		direction.z += 1
	if Input.is_action_pressed('move_right'):
		direction.x += 1
		direction.z -= 1
		
	# Reset jump counter when on floor
	if is_on_floor() and nb_jumps != 0:
		jumping = false
		nb_jumps = 0
		
	# First jump
	if is_on_floor() and Input.is_action_pressed('jump'):
		target_velocity.y = jump_strength
		nb_jumps += 1
		jumping = true

	# Double jump
	if nb_jumps < 2 and Input.is_action_pressed('jump') and delay_count > jump_delay:
		target_velocity.y = jump_strength
		nb_jumps = 0
		delay_count = 0
		jumping = false
	
	# Jump delay counter
	if jumping == true:
		delay_count += delta

	# Normalize
	# Set rotation
	if direction != Vector3.ZERO:
		direction = direction.normalized()
		$Pivot.basis = Basis.looking_at(direction, Vector3.UP, true)
		
		# Ground velocity
		target_velocity.x = direction.x * speed
		target_velocity.z = direction.z * speed

	if not is_on_floor():
		target_velocity.y = target_velocity.y - (fall_acceleration*delta)
	
	velocity = target_velocity
	target_velocity = Vector3.ZERO
	move_and_slide()
	
	# Camera Smoothness
	$CameraControl.position = lerp($CameraControl.position,position,0.15)

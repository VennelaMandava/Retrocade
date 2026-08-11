extends CharacterBody2D

const SPEED = 130.0
const JUMP_FORCE = -250.0

# Get the gravity from the project settings to be sync'd with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var player = $AnimatedSprite2D

func _physics_process(delta):
	# Add the gravity
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle Jump: Triggers on Right Ctrl OR Up Arrow (p2_up)
	var wants_to_jump = Input.is_action_just_pressed("p2_jump") or Input.is_action_just_pressed("p2_up")
	
	if wants_to_jump and is_on_floor():
		velocity.y = JUMP_FORCE

	# Get the input direction: Left Arrow / Right Arrow keys or Left / Right Analog
	var dir = Input.get_axis("p2_left", "p2_right")
	if dir:
		velocity.x = dir * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	if dir > 0:
		player.flip_h = false
	elif dir<0:
		player.flip_h = true
	if is_on_floor():
		if dir == 0:
			player.play("idle")
		else:
			player.play("run")
	else:
		player.play("jump")
	move_and_slide()

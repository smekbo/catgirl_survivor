extends CharacterBody2D


signal announce_location(Vector2)

const SPEED = 300.0
const JUMP_VELOCITY = -400.0


func _physics_process(delta: float) -> void:
	# Add the gravity.
	# if not is_on_floor():
	# 	velocity += get_gravity() * delta

	# Handle jump.
	# if Input.is_action_just_pressed("ui_accept") and is_on_floor():
	# 	velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var horizontal := Input.get_axis("move_left", "move_right")
	if horizontal:
		velocity.x = horizontal * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	var vertical := Input.get_axis("move_up", "move_down")
	if vertical:
		velocity.y = vertical * SPEED
	else: 
		velocity.y = move_toward(velocity.y, 0, SPEED)

	move_and_slide()


func _on_announce_location():
	announce_location.emit(position)

extends CharacterBody2D

var speed = 60

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var facing_right = true

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta  # Apply gravity when not on the floor
	else:
		velocity.y = 0  # Reset vertical velocity when on the floor

	if $RayCast2D.is_colliding() and is_on_floor():
		speed = -speed  # Reverse the speed to flip direction
		facing_right = speed > 0  # Update facing_right based on the direction of speed
		scale.x = abs(scale.x) * (1 if facing_right else -1)  # Flip the character's scale

	velocity.x = speed
	move_and_slide()  # Move the character

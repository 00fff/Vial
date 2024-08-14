extends CharacterBody2D

# Speed of the character's movement
var speed = 60

# Gravity value retrieved from the project settings
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

# Boolean to track if the character is facing right
var facing_right = true

# Function called every frame to process physics-related logic
func _physics_process(delta):
	# Apply gravity when the character is not on the floor
	if not is_on_floor():
		velocity.y += gravity * delta
	
	# Check if the RayCast2D is not colliding and the character is on the floor
	# If true, flip the character's direction
	if !$RayCast2D.is_colliding() and is_on_floor():
		flip()

	# Update the horizontal velocity with the current speed
	velocity.x = speed

	# Move the character according to the current velocity
	move_and_slide()

# Function to flip the character's direction
func flip():
	# Toggle the facing_right variable to the opposite state
	facing_right = !facing_right
	
	# Flip the character's scale on the x-axis
	scale.x = abs(scale.x) * -1
	
	# Adjust the speed based on the new facing direction
	if facing_right:
		speed = abs(speed)  # Move right
	else:
		speed = abs(speed) * -1  # Move left

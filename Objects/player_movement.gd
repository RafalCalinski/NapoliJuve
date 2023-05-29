extends RigidBody2D

const max_speed = 10
const acceleration = 50
const friction = 15

var input = Vector2.ZERO
var velocity = Vector2.ZERO

func get_input():
	input.x = int(Input.is_action_pressed("Right")) - int(Input.is_action_pressed("Left"))
	input.y = int(Input.is_action_pressed("Down")) - int(Input.is_action_pressed("Up"))
	return input.normalized()
# Called when the node enters the scene tree for the first time.
func player_movement(delta):
	input = get_input()
	
	if input == Vector2.ZERO:
		if velocity.length() > (friction * delta):
			velocity -= velocity.normalized() * (friction * delta)
		else:
			velocity = Vector2.ZERO
	else:
		velocity += (input * acceleration * delta)
		velocity = velocity.limit_length(max_speed)
		


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	
	player_movement(delta)
	move_and_collide(velocity)
	look_at(get_global_mouse_position())

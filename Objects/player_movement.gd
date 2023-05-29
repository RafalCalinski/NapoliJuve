extends CharacterBody2D



const max_speed = 500
const acceleration = 500
const friction = 500

var input = Vector2.ZERO

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
	move_and_slide()
	look_at(get_global_mouse_position())
	
	
func _unhandled_input(event: InputEvent):
	if event.is_action_released("shoot"):
		shoot()
		
func shoot():
	print("shoot")

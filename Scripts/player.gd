extends CharacterBody2D

@export var bullet_scene : PackedScene
@export var melee_scene : PackedScene

const max_speed = 1000
const max_sprint_speed = 1500
const acceleration = 3000
const friction = 3000

var input = Vector2.ZERO

var inventory = [
{"name": "wood", "amount": 0, "size": 1}, 
{"name": "stick", "amount": 0, "size": 1},
]

func get_input():
	input.x = int(Input.is_action_pressed("Right")) - int(Input.is_action_pressed("Left"))
	input.y = int(Input.is_action_pressed("Down")) - int(Input.is_action_pressed("Up"))
	return input.normalized()
	

func player_movement(delta):
	input = get_input()
	
	if input == Vector2.ZERO:
		if velocity.length() > (friction * delta):
			velocity -= velocity.normalized() * (friction * delta)
		else:
			velocity = Vector2.ZERO
	else:
		velocity += (input * acceleration * delta)
		if Input.is_action_pressed("sprint"):
			velocity = velocity.limit_length(max_sprint_speed)
		else:
			velocity = velocity.limit_length(max_speed)
		


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	player_movement(delta)
	move_and_slide()
	look_at(get_global_mouse_position())
	
	
func _unhandled_input(event: InputEvent):
	if event.is_action_pressed("shoot"):
		shoot()
	if event.is_action_pressed("melee"):
		melee()
		
func shoot():
	var b = bullet_scene.instantiate()
	owner.add_child(b)
	b.transform = $Marker2D.global_transform
	
func melee():
	var m = melee_scene.instantiate()
	owner.add_child(m)
	m.transform = $Marker2D.global_transform
	$AudioStreamPlayer.play()
	

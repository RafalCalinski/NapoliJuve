extends Area2D

@export var speed = 2000

func start(pos):
	position = pos

func _process(delta):
	position += transform.x * speed * delta



func _on_area_entered(_area):
	pass
	#if area.is_in_group("nazwa grupy"):


func _on_timer_timeout():
	queue_free()

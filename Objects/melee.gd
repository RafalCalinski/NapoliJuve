extends Area2D

func _ready():
	$AnimationPlayer.play("Slash")


func _on_area_entered(_area):
	pass
	#if area.is_in_group("nazwa grupy"):


func _on_timer_timeout():
	queue_free()

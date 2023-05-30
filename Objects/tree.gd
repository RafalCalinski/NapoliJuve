extends RigidBody2D

var HP = 3

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_hitbox_area_entered(area):
	HP -= 1
	$AnimationPlayer.play("hit")
	if HP <= 0:
		$AnimationPlayer.play("destroy")
		$Hitbox.queue_free()
		$CollisionShape2D.queue_free()
		$AudioStreamPlayer.play()


#func _on_animation_player_animation_finished(anim_name):
#	queue_free()
func _on_audio_stream_player_finished():
	queue_free()

extends RigidBody2D

@export var loot : PackedScene

var HP = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_hitbox_area_entered(_area):
	HP -= 1
	$AnimationPlayer.play("RESET")
	$AnimationPlayer.play("hit")
	$hitsound.play()
	if HP <= 0:
		$AnimationPlayer.play("destroy")
		$Hitbox.queue_free()
		$CollisionShape2D.queue_free()
		$AudioStreamPlayer.play()
		
		var wood = loot.instantiate()
		
		for i in range(3, randi_range(4,5)):
			owner.call_deferred("add_child", wood)
			wood.position.x = global_position.x + randf_range(-10,10)
			wood.position.y = global_position.y + randf_range(-10,10)
			wood.rotation = randf_range(0, 360)


#func _on_animation_player_animation_finished(anim_name):
#	queue_free()
func _on_audio_stream_player_finished():
	queue_free()
	

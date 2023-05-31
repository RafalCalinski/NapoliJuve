extends Node2D

func _on_area_2d_area_entered(_area):
	var player = _area.get_parent()
	player.inventory[0]["amount"] +=1
	queue_free()
	
	print(player.inventory[0])
	
func _ready():
	$AnimationPlayer.play("instantiate")

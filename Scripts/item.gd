extends Node2D
class_name Item
var id = 0
func _on_area_2d_area_entered(_area):
	var player = _area.get_parent()
	player.inventory[id]["amount"] +=1
	queue_free()
	
	print(player.inventory[id])
	
func _ready():
	$AnimationPlayer.play("instantiate")
	


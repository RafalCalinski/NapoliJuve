extends Node2D
class_name Item

var id = 0

func _on_area_2d_area_entered(_area):
	var player = _area.get_parent()
	player.capacity += player.inventory[id]["size"]
	if player.capacity <= player.max_capacity:
		player.inventory[id]["amount"] +=1
		queue_free()
	else:
		player.capacity -= player.inventory[id]["size"]
	
	print(player.inventory[id])
	print(player.capacity)
	

	


extends Node2D

@export var tree : PackedScene
@export var stone : PackedScene

# Called when the node enters the scene tree for the first time.
func _ready():
	spawn_objects() # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func spawn_objects():
	for i in range(150):
		var trees = tree.instantiate()
		var stones = stone.instantiate()
		add_child(trees)
		trees.position = global_position + Vector2(randf_range(-10000,10000), randf_range(-10000,10000))
		add_child(stones)
		stones.position = global_position + Vector2(randf_range(-10000,10000), randf_range(-10000,10000))

extends Camera3D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x -= 0.1
	if position.x <= 0.221:
		position.x = 0.221
		
	
		


func _on_end_timeout():
	get_tree().change_scene_to_file("res://end.tscn")

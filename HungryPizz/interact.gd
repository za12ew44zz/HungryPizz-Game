extends RayCast3D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if is_colliding():
		if get_collider() is Node:
			if get_collider().is_in_group("box") && Input.is_action_just_pressed("mouse-left"):
				
				$"../../../CSGBox3D2".queue_free()
				$"../../../key_pickup".play()

		if get_collider() is Node:
			var check_door = false
			if get_collider().is_in_group("door") && Input.is_action_just_pressed("mouse-left"):
			
				
				$"../../../door_pivot".rotation.y =  -140
		if get_collider() is Node:
			var check_door = false
			if get_collider().is_in_group("pizza") && Input.is_action_just_pressed("mouse-left"):
				
				$"../../../pizza".queue_free()
				Global.pizza += 1
				$"../../../Root Scene".visible = true
					
			

extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready():
	$scream/CollisionShape3D.disabled = true
	$door_pivot/door/MeshInstance3D/interact_door/CollisionShape3D.disabled = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Global.pizza == 1:
		$scream/CollisionShape3D.disabled = false


func _on_timer_knock_timeout():
	$knock.play()


func _on_scream_body_entered(body):
	if body.is_in_group("player"):
		
		get_tree().change_scene_to_file("res://ghostscene.tscn")


func _on_can_open_door_timeout():
	$door_pivot/door/MeshInstance3D/interact_door/CollisionShape3D.disabled = false

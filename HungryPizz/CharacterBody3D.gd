extends CharacterBody3D


const SPEED = 1.3
const JUMP_VELOCITY = 4.5
@export var sens = 0.3
@onready var pivot = $Neck


# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = 9.8
var pick_object

func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	print(Input.mouse_mode)



func _input(event):
	if event is InputEventMouseMotion:
		rotate_y(deg_to_rad(-event.relative.x * sens))
		pivot.rotate_x(deg_to_rad(-event.relative.y * sens))
		pivot.rotation.x = clamp(pivot.rotation.x,deg_to_rad(-90),deg_to_rad(45))

func _physics_process(delta):
	
	if not is_on_floor():
		velocity.y -= gravity * delta

	
	
	if Input.is_action_just_pressed("flashlight"):
			$Neck/flashlight/SpotLight3D.visible  = !$Neck/flashlight/SpotLight3D.visible
			if $Neck/flashlight/SpotLight3D.visible == true:
				$"../flashlight_ON".play()
			if $Neck/flashlight/SpotLight3D.visible == false:
				$"../flashlight_ON".play()
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir = Input.get_vector("a", "d", "w", "s")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
		if $"../Timer_walk".time_left <= 0:
			
			$"../walking".pitch_scale = randf_range(1,1.2)
			$"../walking".play()
			$"../Timer_walk".start(1)
		
	else:		
	
		velocity.x = 0.0
		velocity.z = 0.0
	
		
		

	move_and_slide()

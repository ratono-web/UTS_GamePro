extends CharacterBody2D

@onready var bullet = preload("res://scenes/bullet.tscn")

const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var b

func _physics_process(delta: float) -> void:
	
	shoot()
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_up") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

func shoot():
	if Input.is_action_just_pressed("ui_accept"):
		b = bullet.instantiate()
		get_parent().add_child(b)
		b.global_position = $Marker2D.global_position


func _on_button_pressed() -> void:
	get_tree().paused = false
	get_tree().reload_current_scene()

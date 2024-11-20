extends Sprite2D

func _ready():
	scale = Vector2(.1, .1)

func _physics_process(delta: float) -> void:
	position.x += 5


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()

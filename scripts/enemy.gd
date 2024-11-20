extends Node2D


@onready var game_over_screen = $"../GameOverScreen"
var i
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
	i = -5


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.y += i
	if position.y < 400:
		i = 5
	if position.y >560:
		i = -5


func _on_area_2d_area_entered(area: Area2D) -> void:
	area.get_parent().queue_free()
	queue_free()
	get_tree().paused = true
	game_over_screen.visible = true

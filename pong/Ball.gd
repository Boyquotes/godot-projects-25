extends RigidBody2D

export var speed :float
var screen_size :Vector2

func _ready() -> void:
	screen_size = get_viewport().size
	position = screen_size / 2

func _process(delta: float) -> void:
	pass

extends Node2D

var file = File.new()

var movement = Vector2(120, 0)

func _process(delta: float) -> void:
	$Sprite.position += movement * delta

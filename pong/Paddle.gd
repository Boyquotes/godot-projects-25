extends Area2D

signal bounce

export var region :Rect2
export var velocity :int

const offset = 30
var score :int
var screen_size :Vector2
var region_offset :float

func _ready() -> void:
	$Sprite.set_region_rect(region)
	region_offset = region.size.y / 2
	screen_size = get_viewport().size
	position.x = offset
	reposition()

func _on_Paddle_body_entered(body: Node) -> void:
	emit_signal("bounce")

func reposition() -> void:
	position.y = screen_size.y / 2

func _process(delta: float) -> void:
	if Input.is_action_pressed("up"):
		position.y -= velocity * delta
	if Input.is_action_pressed("down"):
		position.y += velocity * delta
	position.y = clamp(position.y, region_offset, screen_size.y - region_offset)

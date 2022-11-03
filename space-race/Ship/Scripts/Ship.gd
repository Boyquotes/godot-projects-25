extends Node2D

export var velocity :int
export var starting_offset :int
export var isplayer :bool

func _ready() -> void:
	reset_position()

func _process(delta: float) -> void:
	if isplayer && Input.is_action_pressed("ui_up"):
		position.y -= velocity * delta

func reset_position():
	var viewport = get_viewport().size
	position.y = viewport.y - starting_offset
	if isplayer:
		position.x = viewport.x / 4
	else:
		position.x = viewport.x / 2 + viewport.x / 4


func _on_Bullet_clash() -> void:
	reset_position()

extends Area2D

signal hit

export var speed = 400 # How fast the player will move (pixels/sec).
var screen_size :Vector2 # Size of the game window.
var target = Vector2.ZERO # To hold the clicked position.

func _ready() -> void:
	screen_size = get_viewport().size
	hide()

func _process(delta: float) -> void:
	var velocity = Vector2.ZERO # The player's movement vector.
	
	# Move towars the target and stop when close.
	if position.distance_to(target) > 10:
		velocity = target - position
	
	# Remove keyboard controls.
	#if Input.is_action_pressed("move_right"):
	#	velocity.x += 1
	#if Input.is_action_pressed("move_left"):
	#	velocity.x -= 1
	#if Input.is_action_pressed("move_up"):
	#	velocity.y -= 1
	#if Input.is_action_pressed("move_down"):
	#	velocity.y += 1
	
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$AnimatedSprite.play()
	else:
		$AnimatedSprite.stop()
	
	position += velocity * delta
	position.x = clamp(position.x, 0, screen_size.x)
	position.y = clamp(position.y, 0, screen_size.y)
	
	if velocity.x != 0:
		$AnimatedSprite.animation = "walk"
		$AnimatedSprite.flip_h = false
		$AnimatedSprite.flip_h = velocity.x < 0
	elif velocity.y != 0:
		$AnimatedSprite.animation = "up"
		$AnimatedSprite.flip_v = velocity.y > 0


func _on_Player_body_entered(body: Node) -> void:
	hide()
	emit_signal("hit")
	# Must be deferred as we can't change physics properties on a physic callback.
	$CollisionShape2D.set_deferred("disabled", true)

func start_pos(pos):
	position = pos
	# Initial target is the start position
	target = pos
	show()
	$CollisionShape2D.disabled = false

# Change the target whenever a touch event happens.
func _input(event):
	if event is InputEventScreenTouch and event.pressed:
		target = event.position

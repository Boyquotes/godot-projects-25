extends CanvasLayer

var speed = 400 # speed of godot logo movement

# This way of handling input is not clean use provided input map instead
func _unhandled_input(event: InputEvent) -> void:
#	if event is InputEventKey:
#		if event.pressed and event.scancode == KEY_ESCAPE:
#			get_tree().quit()
	pass

func _ready() -> void:
	$Sprite.position = get_viewport().size / 2

# Using input maps to handle input.
# If you want to see unhandled input uncomment the unhandled_input codes.
func _process(delta: float) -> void:
	if Input.is_action_pressed("ui_cancel"): # i.e. Esc by default
		get_tree().quit() # quit game
	
	if Input.is_action_pressed("ui_left"):
		$Sprite.position.x -= speed * delta
	if Input.is_action_pressed("ui_right"):
		$Sprite.position.x += speed * delta
	if Input.is_action_pressed("ui_up"):
		$Sprite.position.y -= speed * delta
	if Input.is_action_pressed("ui_down"):
		$Sprite.position.y += speed * delta
	
	# We can provide input from within game
	# Uncomment this section to see the godot logo move on it's own to the left
	#var ev = InputEventAction.new()
	## Set as "ui_left", pressed.
	#ev.action = "ui_left"
	#ev.pressed = true
	## Feedback.
	#Input.parse_input_event(ev)

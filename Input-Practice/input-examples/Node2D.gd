extends Node2D

const messege = "You are pressing ui_select"
# You can either poll for input or handle it as a event
# In first case when a button is pressed something happens you can use _input
# Otherwise if you want something to happen as long an Input happens use Input singleton

func _ready() -> void:
	$Sprite.position = get_viewport().size / 2


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_select"):
		$Label.text = messege
	
	# Here we are trying to see what actually each event looks like
	print(event.as_text())
	
	# Let's get information about mouse input
	# And also print if user does mess with scroll wheel up or presses left click
	if event is InputEventMouseButton:
		print("mouse button event at: ", event.position)
		if event.button_index == BUTTON_LEFT and event.pressed:
			print("Left Mouse button pressed")
		if event.button_index == BUTTON_WHEEL_UP and event.pressed:
			print("You are wheeling up!")
	
	# Let's check if user pressed is S because Why not?
	# Also check if shift modifier is applied if so do something crazy!
	if event is InputEventKey and event.pressed:
		if event.scancode == KEY_S:
			if event.shift:
				get_tree().quit()
			else:
				print("S was pressed")

# using Input singleton helps you to do something as long as someone is holding a button
func _physics_process(delta: float) -> void:
	if Input.is_action_pressed("ui_left"):
		$Sprite.position.x -= 400 * delta

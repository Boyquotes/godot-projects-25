extends Node2D

var targetNumber :int
var guessedNumber :int
var number :Label
var tries :int

func _ready() -> void:
	randomize()
	number = $Control/VBoxContainer/HBoxContainer/guess

func game_start() -> void:
	tries = 0
	$Control/VBoxContainer/Message.text = "Guess A Number between 1 and 99 inclusive"
# warning-ignore:narrowing_conversion
	targetNumber = round(rand_range(1, 99))
	$Control/VBoxContainer/Button.visible = false
	$Control/VBoxContainer/HBoxContainer.visible = true
	$Control/VBoxContainer/Check.visible = true

func _on_Button_pressed() -> void:
	game_start()

func _input(event):
	if event is InputEventKey and event.pressed:
		if event.scancode == KEY_1:
			number.text += "1"
		if event.scancode == KEY_2:
			number.text += "2"
		if event.scancode == KEY_3:
			number.text += "3"
		if event.scancode == KEY_4:
			number.text += "4"
		if event.scancode == KEY_5:
			number.text += "5"
		if event.scancode == KEY_6:
			number.text += "6"
		if event.scancode == KEY_7:
			number.text += "7"
		if event.scancode == KEY_8:
			number.text += "8"
		if event.scancode == KEY_9:
			number.text += "9"
		if event.scancode == KEY_0:
			number.text += "0"
		if event.scancode == KEY_BACKSPACE:
			number.text = ""

func check() -> void:
	tries += 1
	guessedNumber = int($Control/VBoxContainer/HBoxContainer/guess.text)
	if guessedNumber == targetNumber:
		game_won()
	elif guessedNumber > targetNumber:
		$Control/VBoxContainer/Message.text = "You have very high standards don't ya?"
	elif guessedNumber < targetNumber:
		$Control/VBoxContainer/Message.text = "Maybe cheer up a little bit?"


func game_won() -> void:
	$Control/VBoxContainer/Message.text = "You found the correct number! You found it after attempting " + str(tries) + " times."
	$Control/VBoxContainer/HBoxContainer/yourguess.visible = false
	$Control/VBoxContainer/Check.text = "restarting..."
	$Timer.start()

func _on_Check_pressed() -> void:
	check()
	$Control/VBoxContainer/HBoxContainer/guess.text = ""


func _on_Timer_timeout() -> void:
	$Control/VBoxContainer/Message.text = "Guess The Number!"
	$Control/VBoxContainer/Button.visible = true
	$Control/VBoxContainer/HBoxContainer.visible = false
	$Control/VBoxContainer/Check.visible = false

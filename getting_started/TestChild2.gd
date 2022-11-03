extends Node

func _init():
	# Note: a Node doesn't have a "name" yet here
	print("TestRoot init")

func _enter_tree():
	print(name + " enter tree")

func _ready() -> void:
	print(name + " ready")

var test = true
func _process(delta: float) -> void:
	if test:
		print(name + " process")
	test = false

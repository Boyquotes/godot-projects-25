extends Node2D

signal clash

func _on_Area2D_area_entered(area: Area2D) -> void:
	emit_signal("clash")

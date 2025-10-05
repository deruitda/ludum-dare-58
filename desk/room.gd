extends Node2D
class_name Room

signal progress_button_click()

func _on_progress_button_click() -> void:
	progress_button_click.emit()
	pass # Replace with function body.

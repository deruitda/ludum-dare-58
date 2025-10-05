extends Node2D
class_name Room

@onready var binder: Binder = $Binder

signal progress_button_click()

func _on_progress_button_click() -> void:
	progress_button_click.emit()
	pass # Replace with function body.


func _on_binder_button_button_pressed() -> void:
	binder.visible = true
	pass # Replace with function body.

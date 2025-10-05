extends Control
class_name WorkerActionRow
@onready var give_raise_button: Button = $GiveRaiseButton

@onready var worker: Worker

signal on_give_raise_button_pressed
signal on_fire_worker_button_pressed

func set_worker(new_worker: Worker):
	worker = new_worker
	refresh()
	
func refresh():
	if worker.needs_a_raise():
		give_raise_button.visible = true
	else:
		give_raise_button.visible = false

func _on_fire_worker_button_button_up() -> void:
	on_fire_worker_button_pressed.emit()
	pass # Replace with function body.

func _on_give_raise_button_button_up() -> void:
	on_give_raise_button_pressed.emit()
	pass # Replace with function body.

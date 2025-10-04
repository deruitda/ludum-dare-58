extends ColorRect

class_name Resume

signal on_hire_button_pressed()

@export var name_value: TextEdit
@export var type_value: TextEdit
@export var cost_value: TextEdit

func set_worker(adding_worker: Worker):
	name_value.text = adding_worker.worker_name
	type_value.text = adding_worker.worker_type.type
	cost_value.text = "$" + str(adding_worker.cost_per_week)
	

func _on_hire_button_pressed() -> void:
	on_hire_button_pressed.emit()

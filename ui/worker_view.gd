extends Control
class_name WorkerView
@export var name_value: TextEdit
@export var type_value: TextEdit
@export var cost_value: TextEdit

@onready var worker: Worker
signal action_button_pressed(worker: Worker)

func set_worker(new_worker: Worker):
	worker = new_worker
	name_value.text = worker.worker_name
	type_value.text = worker.worker_type.type
	cost_value.text = "$" + str(worker.cost_per_week)


func _on_action_button_button_up() -> void:
	print("pressed")
	action_button_pressed.emit(worker)
	pass # Replace with function body.

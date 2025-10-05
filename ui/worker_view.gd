extends Control
class_name WorkerView
@export var name_value: TextEdit
@export var type_value: TextEdit
@export var cost_value: TextEdit

@onready var worker: Worker

func set_worker(new_worker: Worker):
	worker = new_worker
	name_value.text = worker.worker_name
	type_value.text = worker.worker_type.type
	cost_value.text = "$" + str(worker.get_cost_per_week())

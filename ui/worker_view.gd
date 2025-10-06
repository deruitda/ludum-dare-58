extends Control
class_name WorkerView
@export var name_value: Label
@export var respect_per_week: StatLabel
@export var cost_per_week: StatLabel
@export var is_hired: bool = false

@onready var worker: Worker


func set_worker(new_worker: Worker):
	worker = new_worker
	name_value.text = worker.worker_name
	if is_hired == false:
		respect_per_week.set_value(1)
	else:
		respect_per_week.set_value(worker.get_forecasted_cost().respect)
		
	cost_per_week.set_value(worker.get_forecasted_cost().cost)

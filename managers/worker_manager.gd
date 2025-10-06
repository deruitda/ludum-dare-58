extends Node

signal worker_hired(worker: Worker)

func hire_worker(worker: Worker) -> void:
	add_child(worker)
	worker_hired.emit(worker)

func get_workers() -> Array[Worker]:
	var return_array: Array[Worker]
	for child in get_children():
		if child is Worker:
			return_array.append(child as Worker)
	return return_array

func remove_worker(worker: Worker) -> void:
	remove_child(worker)
	worker.queue_free()

func get_number_of_workers() -> int:
	return get_child_count()

func get_forecasted_expenses() -> Cost:
	var return_cost = Cost.new()
	for worker in WorkerManager.get_workers():
		return_cost.add_to_cost(worker.get_forecasted_cost().get_only_negative_cost())
	
	return return_cost

func get_forecasted_cost() -> Cost:
	var return_cost = Cost.new()
	for worker in WorkerManager.get_workers():
		return_cost.add_to_cost(worker.get_forecasted_cost())
	
	return return_cost

func get_forecasted_income() -> Cost:
	var return_cost = Cost.new()
	for worker in WorkerManager.get_workers():
		return_cost.add_to_cost(worker.get_forecasted_cost().get_only_positive_cost())
	
	return return_cost

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

func get_number_of_workers() -> int:
	return get_child_count()

func get_forecasted_expenses() -> int:
	var forecasted_expenses: int = 0
	for worker in WorkerManager.get_workers():
		forecasted_expenses = forecasted_expenses + worker.cost_per_week
	
	return forecasted_expenses

func get_forecasted_respect() -> int:
	var forecasted_respect: int = 0
	for worker in WorkerManager.get_workers():
		forecasted_respect = forecasted_respect + worker.get_current_weekly_respect_amount()
	
	return forecasted_respect

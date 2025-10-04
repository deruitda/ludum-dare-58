extends Node
class_name WorkerManager

@export var candidate_manager: CandidateManager

signal worker_hired(worker: Worker)

func _ready() -> void:
	candidate_manager.worker_hired.connect(hire_worker)

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

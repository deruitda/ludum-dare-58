extends Node

class_name WorkerManager
@export var candidate_manager: CandidateManager

func _ready() -> void:
	candidate_manager.worker_hired.connect(hire_worker)

func hire_worker(worker: Worker) -> void:
	add_child(worker)

func get_workers() -> Array[Worker]:
	var return_array: Array[Worker]
	for child in get_children():
		if child is Worker:
			return_array.append(child as Worker)
	return return_array

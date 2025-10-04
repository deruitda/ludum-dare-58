extends Node
class_name CandidateManager

signal worker_generated(worker: Worker)

func _ready() -> void:
	pass
	#CandidateManagerSignalBus.hire_worker_button_pressed.connect()

func generate_worker() -> void:
	var new_worker = Worker.new()
	new_worker.worker_name = generate_name()
	new_worker.cost_per_week = randi()
	new_worker.worker_type = preload("res://entities/Worker/WorkerType/soldier.tres")
	add_child(new_worker)
	worker_generated.emit(new_worker)

func generate_name() -> String:
	return "Steve"

func get_hierable_workers() -> Array[Worker]:
	var return_array: Array[Worker]
	for child in get_children():
		if child is Worker:
			return_array.append(child as Worker)
	return return_array
	
func get_number_of_hierable_workers() -> int:
	return get_child_count()

func hire_worker_by_index(index: int) -> Worker:
	var hierable_workers = get_hierable_workers()
	var worker = hierable_workers.pop_at(index)
	remove_child(worker)
	return worker

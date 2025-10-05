extends Node


signal worker_generated(worker: Worker)
signal worker_hired(worker: Worker)

@onready var name_generator: NameGenerator

func _ready() -> void:
	name_generator = NameGenerator.new()
	add_child(name_generator)
	pass
	#CandidateManagerSignalBus.hire_worker_button_pressed.connect()

func generate_worker() -> void:
	var new_worker = Worker.new()
	new_worker.worker_name = name_generator.generate_name()
	name_generator.queue_free()
	new_worker.cost_per_week = randi() % 20 + 10 # between 10 and 30
	new_worker.worker_type = preload("res://entities/Worker/WorkerType/soldier.tres")
	add_child(new_worker)
	worker_generated.emit(new_worker)



func get_hierable_workers() -> Array[Worker]:
	var return_array: Array[Worker]
	for child in get_children():
		if child is Worker:
			return_array.append(child as Worker)
	return return_array
	
func get_number_of_hierable_workers() -> int:
	return get_child_count()

func hire_worker_by_index(index: int) -> void:
	var hierable_workers = get_hierable_workers()
	var worker = hierable_workers.pop_at(index)
	remove_child(worker)
	worker_hired.emit(worker)

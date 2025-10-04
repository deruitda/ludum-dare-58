extends Node

class_name WorkerManager

@onready var worker_manager: Node = $"."

func hire_worker(worker: Worker) -> void:
	worker_manager.add_child(worker)

func get_workers() -> Array[Worker]:
	return worker_manager.children() as Array[Worker]

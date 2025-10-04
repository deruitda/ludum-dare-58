extends Node
class_name Capacity

@onready var current_worker = Worker

func set_worker(worker: Worker) -> void:
	current_worker = worker

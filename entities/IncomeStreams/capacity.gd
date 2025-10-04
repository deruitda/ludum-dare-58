extends Node
class_name Capacity

@onready var current_worker = Worker
@onready var is_taken: bool = false

func set_worker(worker: Worker) -> void:
	current_worker = worker
	is_taken = true

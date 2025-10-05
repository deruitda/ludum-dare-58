extends Node

func create_vacant_capacity_item():
	var capacity = Capacity.new()
	add_child(capacity)

func add_worker(worker: Worker, index: int) -> void:
	pass
	

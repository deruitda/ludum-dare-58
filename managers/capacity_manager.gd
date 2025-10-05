extends Node

const CAPACITY = preload("uid://d24t86ob64maj")

func create_capacity(income_stream: IncomeStream, worker: Worker):
	var capacity = CAPACITY.instantiate() as Capacity
	add_child(capacity)
	capacity.worker = worker
	capacity.income_stream = income_stream

func get_capacities_by_worker(worker: Worker) -> Array[Capacity]:
	var return_array: Array[Capacity] = []
	for capacity in get_children():
		var c = capacity as Capacity
		if c.worker == worker:
			return_array.append(c)
		
	return return_array

func get_capacities_by_income_stream(income_stream: IncomeStream) -> Array[Capacity]:
	var return_array: Array[Capacity] = []
	for capacity in get_children():
		var c = capacity as Capacity
		if c.income_stream == income_stream:
			return_array.append(c)
		
	return return_array

func abandon_by_income_stream(income_stream: IncomeStream):
	var capacities = get_capacities_by_income_stream(income_stream)
	for cap in capacities:
		remove_child(cap)
		cap.queue_free()

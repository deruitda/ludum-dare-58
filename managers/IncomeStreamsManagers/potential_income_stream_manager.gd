extends Node
class_name PotentialIncomeStreamsManager

signal potential_income_stream_generated(income_stream: IncomeStream)
signal income_stream_accepted(income_stream: IncomeStream)
var income_stream_types = [preload("res://entities/IncomeStreams/IncomeStreamType/debt_collection.tres")]

func generate_income_stream() -> void:
	var income_stream_type: IncomeStreamTypeResource = income_stream_types.pick_random()
	var new_income_stream = income_stream_type.create_income_stream_node()
	#match new_income_stream.type:
		#"Debt Collection": 
			#new_income_stream.name = generate_name()
			#new_income_stream.income_per_week = generate_income_stream()
			#new_income_stream.duration_in_weeks = generate_duration_in_weeks()
			#new_income_stream.active_weeks_transpired = generate_active_weeks_transpired()
			#new_income_stream.total_weekly_income = generate_total_weekly_income()
			#new_income_stream.currentWorkers = []
			#new_income_stream.cost = generate_cost()
			#new_income_stream.capacity = generate_capacity()
			#new_income_stream.description = generate_description()
			#new_income_stream.accepted_worker_types = generate_accepted_worker_types()	
			#print 
		
		
	#////new_income_stream.income_stream_name = generate_name()
	#//new_income_stream.accepted_worker_types = [preload("res://entities/Worker/WorkerType/soldier.tres")]
	add_child(new_income_stream)
	potential_income_stream_generated.emit(new_income_stream)

func generate_name() -> String:
	return "Debt Collection"
	
func get_potential_income_streams() -> Array[IncomeStream]:
	var return_array: Array[IncomeStream]
	for child in get_children():
		if child is IncomeStream:
			return_array.append(child as IncomeStream)
	return return_array

func accept_income_stream_by_index(index: int) -> IncomeStream:
	var potential_income_streams = get_potential_income_streams()
	var income_stream = potential_income_streams.pop_at(index)
	remove_child(income_stream)
	income_stream_accepted.emit(income_stream)
	return income_stream

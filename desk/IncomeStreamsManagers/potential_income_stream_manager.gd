extends Node
class_name PotentialIncomeStreamsManager


func generate_income_stream() -> void:
	var new_income_stream = IncomeStream.new()
	new_income_stream.income_stream_name = generate_name()
	new_income_stream.accepted_worker_types = [preload("res://entities/Worker/WorkerType/soldier.tres")]
	add_child(new_income_stream)

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
	return income_stream

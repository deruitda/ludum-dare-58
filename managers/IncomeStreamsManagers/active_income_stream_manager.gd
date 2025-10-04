extends Node

class_name ActiveIncomeStreamsManager

signal active_income_stream_added(income_stream: IncomeStream)
signal active_income_stream_removed(income_stream: IncomeStream)

@onready var income_stream_manager: Node = $"."

func accept_income_stream(income_stream: IncomeStream) -> void:
	income_stream_manager.add_child(income_stream)
	active_income_stream_added.emit(income_stream)

func get_income_streams() -> Array[IncomeStream]:
	var return_array: Array[IncomeStream]
	for child in get_children():
		if child is IncomeStream:
			return_array.append(child as IncomeStream)
	return return_array
	
func get_income_stream_by_index(index: int) -> IncomeStream:
	var income_streams = get_income_streams()
	var income_stream = income_streams[index]
	return income_stream

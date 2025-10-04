extends Node

class_name AcceptedIncomeStreamsManager

@onready var income_stream_manager: Node = $"."

func accept_income_stream(income_stream: IncomeStream) -> void:
	income_stream_manager.add_child(income_stream)

func get_income_streams() -> Array[IncomeStream]:
	return income_stream_manager.children() as Array[IncomeStream]
	
func get_income_stream_by_index(index: int) -> IncomeStream:
	var income_streams = get_income_streams()
	var income_stream = income_streams[index]
	return income_stream

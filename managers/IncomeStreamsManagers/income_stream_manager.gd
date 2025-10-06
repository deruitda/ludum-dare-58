extends Node

signal income_stream_added(income_stream: IncomeStream)

func accept_income_stream(income_stream: IncomeStream) -> void:
	add_child(income_stream)
	income_stream_added.emit(income_stream)
	
func get_idle_income_streams() -> Array[IncomeStream]:
	var return_array: Array[IncomeStream] = []
	for child in get_children():
		if child is IncomeStream and child.is_idle():
			return_array.append(child)
	return return_array
	
func get_income_streams() -> Array[IncomeStream]:
	var return_array: Array[IncomeStream] = []
	for child in get_children():
		if child is IncomeStream:
			return_array.append(child)
	return return_array

func get_current_income_streams() -> Array[IncomeStream]:
	var return_array: Array[IncomeStream] = []
	for child in get_children():
		if child is IncomeStream:
			if not child.is_completed():
				return_array.append(child)
	return return_array

func get_active_income_streams() -> Array[IncomeStream]:
	var return_array: Array[IncomeStream] = []
	for child in get_children():
		if child is IncomeStream:
			if not child.is_idle() and not child.is_completed():
				return_array.append(child)
	return return_array

func get_forecasted_cost() -> Cost:
	var return_cost = Cost.new()
	for income_stream in get_current_income_streams():
		return_cost.add_to_cost(income_stream.get_forecasted_cost())
	return return_cost

func get_forecasted_income() -> Cost:
	var return_cost = Cost.new()
	for income_stream in get_current_income_streams():
		return_cost.add_to_cost(income_stream.get_forecasted_income_cost())
	return return_cost

func get_forecasted_expense() -> Cost:
	var return_cost = Cost.new()
	for income_stream in get_current_income_streams():
		return_cost.add_to_cost(income_stream.get_forecasted_expense_cost())
	return return_cost

func abandon_income_stream(income_stream) -> void:
	CapacityManager.remove_capacities_by_income_stream(income_stream)
	remove_child(income_stream)
	income_stream.queue_free()
	
#func check_events() -> Array[IncomeStream]:
	#var return_array: Array[IncomeStream] = []
	#for child in get_children():
		#if child is IncomeStream:
			#child.type
			#return_array.append(child)
	#return return_array
	#
#func get_income_stream_by_index(index: int) -> IncomeStream:
	#var income_streams = get_income_streams()
	#var income_stream = income_streams[index]
	#return income_stream

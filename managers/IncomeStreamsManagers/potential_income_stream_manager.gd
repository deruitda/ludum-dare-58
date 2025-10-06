extends Node

signal potential_income_stream_generated(income_stream: IncomeStream)
signal income_stream_accepted(income_stream: IncomeStream)
#var income_stream_types = [preload("res://entities/IncomeStreams/IncomeStreamType/debt_collection.tres"),preload("res://entities/IncomeStreams/IncomeStreamType/drug_deal.tres")]
const INCOME_STREAM = preload("uid://nqfj0vilw5qr")


var income_stream_types: Array = []

func _ready():
	var dir = DirAccess.open("res://entities/IncomeStreams/IncomeStreamType")
	if dir:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		while file_name != "":
			if file_name.ends_with(".tres"):
				var path = "res://entities/IncomeStreams/IncomeStreamType/" + file_name
				var resource = load(path)
				if resource:
					income_stream_types.append(resource)
			file_name = dir.get_next()
		dir.list_dir_end()	
		
func generate_income_stream() -> void:
	var available_streams = get_available_income_stream_types()
	var chosen_type = available_streams.pick_random()
	var new_income_stream = INCOME_STREAM.instantiate()
	add_child(new_income_stream)
	chosen_type.set_income_stream(new_income_stream)
	potential_income_stream_generated.emit(new_income_stream)

func can_show_income_stream_type(income_stream_type_resource: IncomeStreamTypeResource) -> bool:
	var minimum_total_money: int = Enums.get_minimum_total_money_by_intensity(income_stream_type_resource.requirement.cost_intensity)
	var minimum_total_respect: int = Enums.get_minimum_total_respect_by_intensity(income_stream_type_resource.requirement.respect_intensity)
	
	if GameState.total_money < minimum_total_money:
		return false
		
	if GameState.total_respect < minimum_total_respect:
		return false
	return true

func get_available_income_stream_types() -> Array:
	var available_types = []
	for income_type in income_stream_types:
		if can_show_income_stream_type(income_type):
			available_types.push_back(income_type)
	return available_types
	
func remove_all_income_streams() -> void:
	for income_stream in get_children():
		remove_child(income_stream)
		income_stream.queue_free()

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
	accept_income_stream(income_stream)
	return income_stream

func accept_income_stream(incomeStream: IncomeStream) -> void:
	remove_child(incomeStream)
	GameState.collect_cost(incomeStream.initial_cost)
	income_stream_accepted.emit(incomeStream)

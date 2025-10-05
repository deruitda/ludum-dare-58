extends Node

class_name Worker

@export var total_capacity: int = 1
@export var experience: int = 0
@export var cost_per_week: int = 10
@export var cost_to_hire: int = 10
@export var worker_name: String = ""
@export var worker_type: WorkerTypeResource
@export var number_of_raises: int = 0
@export var current_level: int = 1

func get_cost_per_week() -> int:
	return cost_per_week

func gain_experience() -> void:
	experience = experience + get_current_capacity()
	
func get_current_capacity() -> int:
	return len(get_current_capacities())

func get_current_capacities() -> Array[Capacity]:
	return CapacityManager.get_capacities_by_worker(self)

func has_full_capacity() -> bool:
	return get_current_capacity() == total_capacity

func is_working_income_stream(income_stream: IncomeStream) -> bool:
	for capacity in get_current_capacities():
		if capacity.income_stream == income_stream:
			return true
	return false

func get_level() -> int:
	return number_of_raises + 1
	
func grant_promotion() -> void:
	current_level = current_level + 1

func is_underpaid() -> bool:
	return number_of_raises + 1 < get_level()

func get_current_weekly_respect_amount() -> int:
	var return_val = get_level()
	if is_underpaid():
		return_val = return_val * -1
	return return_val 

extends Node

class_name Worker

@export var total_capacity: int = 1
@export var experience: int = 0
@export var cost_per_week: int = 10
@export var cost_to_hire: int = 10
@export var worker_name: String = ""
@export var worker_type: WorkerTypeResource
@export var number_of_raises: int = 0

func gain_experience() -> void:
	experience = experience + get_current_capacity()
	
func get_current_capacity() -> int:
	return len(CapacityManager.get_capacities_by_worker(self))

func get_level() -> int:
	if experience < 10:
		return 1
	elif experience < 20:
		return 2
	return 3

func is_underpaid() -> bool:
	return number_of_raises + 1 < get_level()

func get_current_weekly_respect_amount() -> int:
	var return_val = get_level()
	if is_underpaid():
		return_val = return_val * -1
	return return_val 

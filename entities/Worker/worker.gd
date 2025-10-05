extends Node

class_name Worker

@export var total_capacity: int = 1
@export var experience: int = 0
@export var cost_per_week: int = 10
@export var cost_to_hire: int = 10
@export var worker_name: String = ""
@export var worker_type: WorkerTypeResource


func gain_experience() -> void:
	experience = experience + get_current_capacity()
	
func get_current_capacity() -> int:
	return len(CapacityManager.get_capacities_by_worker(self))
	
func get_level() -> int:
	return ceil(experience / 10)
	
#func get_current_weekly_respect_amount() -> int:
	#

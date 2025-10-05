extends Node
class_name IncomeStream

@export var income_stream_name: String = ""
@export var income_per_week: int = 20
@export var duration_in_weeks: int = 10
@onready var active_weeks_transpired: int = 0
@onready var total_weekly_income: int = 0
@export var type: IncomeStreamTypeResource
@export var cost = 50
@export var capacity: int = 1
@export var description: String = ""
@export var accepted_worker_types: Array[WorkerTypeResource] = []


		
func get_weeks_left() -> int:
	return duration_in_weeks - active_weeks_transpired

func get_capacities() -> Array[Capacity]:
	return CapacityManager.get_capacities_by_income_stream(self)

func get_capacity() -> int:
	return len(CapacityManager.get_capacities_by_income_stream(self))

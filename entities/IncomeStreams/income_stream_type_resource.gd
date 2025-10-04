extends Resource
class_name IncomeStreamTypeResource

@export var type: String

@export var income_stream_name: String = ""
@export var cost = 50
@export var capacity: int = 1
@export var duration_in_weeks: int = 3
@export var description: String = ""
@export var accepted_worker_types: Array[WorkerTypeResource] = []

func create_income_stream_node() -> IncomeStream:
	var income_stream = IncomeStream.new()
	income_stream.type = self
	
	income_stream.cost = cost
	income_stream.duration_in_weeks = duration_in_weeks
	
	return income_stream

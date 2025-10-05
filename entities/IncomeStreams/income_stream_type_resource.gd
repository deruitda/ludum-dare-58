extends Resource
class_name IncomeStreamTypeResource

@export var type: String

@export var required_respect: int = 0
@export var cost: RangeResource
@export var duration_in_week: RangeResource
@export var return_percentage: FloatRangeResource
@export var capacity: int = 1
@export var description: String = ""
@export var accepted_worker_types: Array[WorkerTypeResource] = []
@export var potential_idle_events: Array[PotentialIdleEventsResource] = []

func set_income_stream(income_stream: IncomeStream) -> void:
	var name_generator = NameGenerator.new()
	var victim_random_name = name_generator.generate_victim_name()
	name_generator.queue_free()
	income_stream.type = self
	
	income_stream.cost = cost.get_random_value()
	income_stream.duration_in_weeks = duration_in_week.get_random_value()
	
	var expected_return_percentage = return_percentage.get_random_value()
	var expected_income = income_stream.cost * expected_return_percentage
	
	income_stream.income_per_week = ceil(expected_income / income_stream.duration_in_weeks)
	income_stream.income_stream_name = type + " " + victim_random_name
	var potential_idle_event = PotentialIdleEvent.new()
	income_stream.type.potential_idle_events.append(potential_idle_event)

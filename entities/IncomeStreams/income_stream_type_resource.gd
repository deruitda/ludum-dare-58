extends Resource
class_name IncomeStreamTypeResource

@export var type: String

@export var required_respect: int = 0

@export var initial_cost_resource: CostResource
@export var weekly_return_intensity_cost: CostResource
@export var completed_cost_resource: CostResource

@export var duration_intensity: Enums.IncomeStreamTimeIntensity



@export var capacity: int = 1
@export var description: String = ""
@export var accepted_worker_types: Array[WorkerTypeResource] = []
@export var potential_idle_events: Array[PotentialIdleEventsResource] = []


func set_income_stream(income_stream: IncomeStream) -> void:
	var name_generator = NameGenerator.new()
	var victim_random_name = name_generator.generate_victim_name()
	name_generator.queue_free()
	income_stream.type = self
	
	income_stream.set_initial_cost(initial_cost_resource.calculate_new_cost())
	income_stream.set_completed_return_cost(completed_cost_resource.calculate_new_cost())
	
	
	var rate = Enums.get_rate_of_return_from_cost_intensity(weekly_return_intensity_cost.cost_intensity)
	var upfront_cash = income_stream.initial_cost.cost
	var weekly_amount = absi((rate * (upfront_cash ) / income_stream.duration_in_weeks))
	if weekly_return_intensity_cost.negative_cost:
		weekly_amount = weekly_amount * -1

	var cost = Cost.new()
	cost.set_cost(weekly_amount)
	cost.set_respect(weekly_return_intensity_cost.calculate_respect())

	
	income_stream.set_weekly_return_cost(cost)
	
	income_stream.duration_in_weeks = Enums.get_duration_in_weeks_from_time_intensity(duration_intensity)
	
	income_stream.income_stream_name = type + " " + victim_random_name
	
	var potential_idle_event = PotentialIdleEvent.new()
	income_stream.type.potential_idle_events.append(potential_idle_event)

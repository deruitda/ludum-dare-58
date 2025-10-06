extends Resource
class_name PotentialIdleEventsResource

@export var idle_event_name: String = ""
@export var chance_of_failure: float = .5
@export var idle_description: String = ""

@export var resolve_cost: CostResource
@export var cost_to_attempt_to_resolve: Enums.IncomeStreamCostIntensity
@export var respect_cost_to_attempt_to_resolve: Enums.IncomeStreamCostIntensity

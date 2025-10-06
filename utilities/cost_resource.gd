extends Resource
class_name CostResource

@export var cost_intensity: Enums.IncomeStreamCostIntensity
@export var respect_intensity: Enums.IncomeStreamCostIntensity

func calculate_cost() -> int:
	return Enums.get_cost_from_cost_intensity(cost_intensity)

func calculate_respect() -> int:
	return Enums.get_respect_cost_from_cost_intensity(respect_intensity)
	
func calculate_rate() -> int:
	return Enums.get_rate_of_return_from_cost_intensity(cost_intensity)

func calculate_new_cost() -> Cost:
	var cost = Cost.new()
	cost.set_cost(calculate_cost())
	cost.set_respect(calculate_respect())
	
	return cost

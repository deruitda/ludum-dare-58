extends Resource
class_name CostResource

@export var cost_intensity: Enums.Intensity
@export var negative_cost: bool = false
@export var respect_intensity: Enums.Intensity
@export var negative_respect_intensity: bool = false

func calculate_cost() -> int:
	var return_val = Enums.get_cost_from_cost_intensity(cost_intensity)
	if negative_cost:
		return_val = return_val * -1
	return return_val

func calculate_respect() -> int:
	var return_val = Enums.get_respect_cost_from_cost_intensity(respect_intensity)
	if negative_respect_intensity:
		return_val = return_val * -1
	return return_val

func calculate_rate() -> int:
	return Enums.get_rate_of_return_from_cost_intensity(cost_intensity)

func calculate_new_cost() -> Cost:
	var cost = Cost.new()
	cost.set_cost(calculate_cost())
	cost.set_respect(calculate_respect())
	
	return cost

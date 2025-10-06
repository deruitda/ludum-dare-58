extends Node

enum Intensity {
	NONE,
	LOW,
	LOW_MEDIUM,
	MEDIUM,
	MEDIUM_HIGH,
	HIGH
}

enum IncomeStreamTimeIntensity {
	INSTANT,
	SHORT,
	MEDIUM,
	LONG,
	RECURRING
}

var base_costs = {
	Enums.Intensity.NONE: 0,
	Enums.Intensity.LOW: 200,
	Enums.Intensity.LOW_MEDIUM: 800,
	Enums.Intensity.MEDIUM: 2000,
	Enums.Intensity.MEDIUM_HIGH: 4000,
	Enums.Intensity.HIGH: 9000
}

func get_cost_from_cost_intensity(intensity: Intensity) -> int:
	var variance = randf_range(0.8, 1.2)
	return int(base_costs[intensity] * variance)

func get_respect_cost_from_cost_intensity(intensity: Intensity) -> int:
	match intensity:
		Enums.Intensity.NONE:
			return 0
		Enums.Intensity.LOW:
			return 1
		Enums.Intensity.LOW_MEDIUM:
			return 3
		Enums.Intensity.MEDIUM:
			return 6
		Enums.Intensity.MEDIUM_HIGH:
			return 15
		Enums.Intensity.HIGH:
			return 30
	return 0

func get_percentage_rate_from_intensity(intensity: int) -> float:
	
	match intensity:
		Enums.Intensity.NONE:
			return 0.0
		Enums.Intensity.LOW:
			return randf_range(0.05, 0.2) 
		Enums.Intensity.LOW_MEDIUM:
			return randf_range(0.2, 0.4)
		Enums.Intensity.MEDIUM:
			return randf_range(0.4, 0.6)
		Enums.Intensity.MEDIUM_HIGH:
			return randf_range(0.6, 0.8)
		Enums.Intensity.HIGH:
			return randf_range(0.8, 1.0)
		
	return 0.0

## @param intensity Enums.Intensity
func get_rate_of_return_from_cost_intensity(intensity: int) -> float:
	match intensity:
		Enums.Intensity.NONE:
			return 0.0
		Enums.Intensity.LOW:
			return randf_range(1.1, 1.2) 
		Enums.Intensity.LOW_MEDIUM:
			return randf_range(1.2, 1.4)
		Enums.Intensity.MEDIUM:
			return randf_range(1.5, 1.8)
		Enums.Intensity.MEDIUM_HIGH:
			return randf_range(2, 2.5)
		Enums.Intensity.HIGH:
			return randf_range(3.0, 5.0)

	return 0
	
## @param intensity Enums.IncomeStreamTimeIntensity
func get_duration_in_weeks_from_time_intensity(intensity: int) -> int:
	match intensity:
		Enums.IncomeStreamTimeIntensity.INSTANT:
			return 1
		Enums.IncomeStreamTimeIntensity.SHORT:
			return randi_range(3, 8)
		Enums.IncomeStreamTimeIntensity.MEDIUM:
			return randi_range(10, 20)
		Enums.IncomeStreamTimeIntensity.LONG:
			return randi_range(20, 30)
	return 1

func get_minimum_total_money_by_intensity(intensity: int) -> int:
	return base_costs[intensity]

func get_minimum_total_respect_by_intensity(intensity: int) -> int:
	match intensity:
		Enums.Intensity.NONE:
			return 0
		Enums.Intensity.LOW:
			return 5
		Enums.Intensity.LOW_MEDIUM:
			return 10
		Enums.Intensity.MEDIUM:
			return 20
		Enums.Intensity.MEDIUM_HIGH:
			return 30
		Enums.Intensity.HIGH:
			return 50
	return 0

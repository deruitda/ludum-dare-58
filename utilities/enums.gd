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

func get_cost_from_cost_intensity(intensity: Enums.Intensity) -> int:
	match intensity:
		Enums.Intensity.NONE:
			return 0
		Enums.Intensity.LOW:
			return randi_range(1, 9) * 10
		Enums.Intensity.LOW_MEDIUM:
			return randi_range(5, 25) * 10
		Enums.Intensity.MEDIUM:
			return randi_range(20, 90) * 10
		Enums.Intensity.MEDIUM_HIGH:
			return randi_range(100, 900) * 10
		Enums.Intensity.HIGH:
			return randi_range(100, 900) * 10
	return 0

func get_respect_cost_from_cost_intensity(intensity: Enums.Intensity) -> int:
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
		

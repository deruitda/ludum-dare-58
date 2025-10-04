extends Resource
class_name FloatRangeResource

@export var min_value: float
@export var max_value: float

func get_random_value() -> float:
	return randf_range(min_value, max_value)

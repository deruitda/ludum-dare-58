extends Resource
class_name RangeResource

@export var min_value: int
@export var max_value: int

func get_random_value() -> int:
	return (randi() % (max_value - min_value)) + min_value

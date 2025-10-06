extends Node
class_name TimeManager

@export var number_of_weeks_in_month: int = 1
var current_week: int = 1
var current_month: int = 1

signal on_current_week_incremented
signal on_current_month_incremented

func increment_week() -> void:
	current_week += 1
	on_current_week_incremented.emit()
	
	if current_week % number_of_weeks_in_month == 0:
		current_month += 1
		on_current_month_incremented.emit()

func get_weeks_left_in_month() -> int:
	return number_of_weeks_in_month - ((current_week - 1) % number_of_weeks_in_month)

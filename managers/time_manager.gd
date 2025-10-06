extends Node
class_name TimeManager

@onready var current_week: int = 1
@onready var current_month: int = 1
@export var number_of_weeks_in_month: int = 4

signal on_current_week_incremented
signal on_current_month_incremented

func increment_week() -> void:
	current_week = current_week + 1
	on_current_week_incremented.emit()
	if current_week % number_of_weeks_in_month:
		current_month = current_month + 1
		on_current_month_incremented.emit()

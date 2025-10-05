extends Control
class_name IdleEventView

@onready var income_stream: IncomeStream

func set_income_stream(new_income_stream: IncomeStream) -> void:
	income_stream = new_income_stream

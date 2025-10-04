extends Control
class_name IncomeStreamDetail

@export var capacity_row: CapacityRow

func set_income_stream(income_stream: IncomeStream) -> void:
	capacity_row.set_income_stream(income_stream)

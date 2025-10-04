extends HBoxContainer
class_name IncomeDataRow

@onready var income_stream: IncomeStream

@export var description_label: Label 
	
func set_income_stream(new_income_stream: IncomeStream) -> void:
	income_stream = new_income_stream
	description_label.text = income_stream.income_stream_name

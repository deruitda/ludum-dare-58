extends Node2D
class_name IncomeStreamView

@export var name_label: Label
@export var expected_weekly_income_label: Label
@export var weeks_left_label: Label

@onready var income_stream: IncomeStream

func set_income_stream(new_income_stream: IncomeStream):
	income_stream = new_income_stream
	name_label.text = income_stream.name
	expected_weekly_income_label.text = "$" + str(income_stream.income_per_week)
	weeks_left_label.text = str(income_stream.get_weeks_left())

extends VBoxContainer
class_name IncomeDataRow

signal on_detail_button_press(income_stream: IncomeStream)
@onready var income_stream: IncomeStream

@onready var status_label: Label = $IncomeDataRow/StatusLabel
@onready var description_label: Label = $IncomeDataRow/DescriptionLabel
@onready var money_per_week_label: Label = $HBoxContainer/MoneyPerWeekLabel
@onready var weeks_left_label: Label = $HBoxContainer/WeeksLeftLabel

func set_income_stream(new_income_stream: IncomeStream) -> void:
	income_stream = new_income_stream
	refresh()

func refresh():
	description_label.text = income_stream.income_stream_name
	if income_stream.is_idle():
		status_label.text = "Idle"
	else:
		status_label.text = "Ready"
	money_per_week_label.text = "Money per Week: $" + str(income_stream.income_per_week)
	weeks_left_label.text = "Weeks Left: " + str(income_stream.get_weeks_left())

func _on_details_button_button_up() -> void:
	on_detail_button_press.emit(income_stream)
	pass # Replace with function body.

extends HBoxContainer
class_name IncomeDataRow

signal on_detail_button_press(income_stream: IncomeStream)
@onready var status_label: Label = $StatusLabel

@onready var income_stream: IncomeStream
@export var description_label: Label 
	
func set_income_stream(new_income_stream: IncomeStream) -> void:
	income_stream = new_income_stream
	refresh()

func refresh():
	description_label.text = income_stream.income_stream_name
	if income_stream.has_full_capacity():
		status_label.text = "Ready"
	else:
		status_label.text = "Idle"

func _on_details_button_button_up() -> void:
	on_detail_button_press.emit(income_stream)
	pass # Replace with function body.

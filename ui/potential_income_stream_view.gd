extends Control
class_name PotentialIncomeStreamView

@onready var income_stream: IncomeStream
@onready var workers_needed_value: Label = $Control/VBoxContainer/WorkersNeededValue
@onready var initial_cost_view: CostView = $Control/InitialCostControl/InitialCostView


@onready var income_stream_view: IncomeStreamView = $IncomeStreamView

func set_income_stream(new_income_stream: IncomeStream):
	income_stream = new_income_stream
	income_stream_view.set_income_stream(income_stream)
	
	initial_cost_view.set_cost(new_income_stream.initial_cost)
	workers_needed_value.text = str(income_stream.capacity)

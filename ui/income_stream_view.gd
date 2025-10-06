extends Control
class_name IncomeStreamView

@onready var income_stream: IncomeStream

@onready var name_label: Label = $NameLabel
@onready var description_label: Label = $DescriptionLabel

@onready var per_week_cost_view: CostView = $PerWeekControl/PerWeekCostView
@onready var completion_reward_control_view: CostView = $CompletionRewardControl/CompletionRewardControlView

@onready var weeks_left_value: StatLabel = $HBoxContainer/WeeksLeftValue
@onready var percentage_label: PercentageLabel = $HBoxContainer2/PercentageLabel


func set_income_stream(new_income_stream: IncomeStream):
	income_stream = new_income_stream
	
	name_label.text = income_stream.income_stream_name
	description_label.text = income_stream.description
	weeks_left_value.set_value(income_stream.get_weeks_left())
	per_week_cost_view.set_cost(income_stream.weekly_return_cost)
	completion_reward_control_view.set_cost(income_stream.completed_return_cost)
	percentage_label.set_percentage(income_stream.percent_chance_of_event)
	

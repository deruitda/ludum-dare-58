extends Node2D
class_name IncomeStreamView

@onready var income_stream: IncomeStream

@onready var name_label: Label = $Control2/NameLabel
@onready var description_label: Label = $Control2/DescriptionLabel

@onready var initial_cost_view: CostView = $Control/InitialCostControl/InitialCostView
@onready var per_week_cost_view: CostView = $Control/PerWeekControl/PerWeekCostView
@onready var completion_reward_control_view: CostView = $Control/CompletionRewardControl/CompletionRewardControlView

@onready var weeks_left_value: Label = $Control/WeeksLeftValue

@onready var percentage_label: PercentageLabel = $Control/PercentageLabel

func set_income_stream(new_income_stream: IncomeStream):
	income_stream = new_income_stream
	name_label.text = income_stream.income_stream_name
	description_label.text = income_stream.description
	
	initial_cost_view.set_cost(new_income_stream.initial_cost)
	per_week_cost_view.set_cost(income_stream.weekly_return_cost)
	completion_reward_control_view.set_cost(income_stream.completed_return_cost)
	
	weeks_left_value.text = str(income_stream.duration_in_weeks)
	

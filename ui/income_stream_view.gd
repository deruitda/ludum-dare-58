extends Control
class_name IncomeStreamView

@onready var income_stream: IncomeStream

@onready var name_label: Label = $NameLabel
@onready var description_label: Label = $DescriptionLabel
@onready var money_per_week_value: StatLabel = $PerWeekControl/MoneyPerWeekValue
@onready var respect_label: StatLabel = $PerWeekControl2/RespectLabel

@onready var completion_reward_control_view: CostView = $CompletionRewardControl/CompletionRewardControlView

@onready var weeks_left_value: StatLabel = $HBoxContainer/WeeksLeftValue
@onready var percentage_label: PercentageLabel = $HBoxContainer2/PercentageLabel


func set_income_stream(new_income_stream: IncomeStream):
	income_stream = new_income_stream
	
	name_label.text = income_stream.income_stream_name
	description_label.text = income_stream.description
	weeks_left_value.set_value(income_stream.get_weeks_left())
	money_per_week_value.set_value(income_stream.weekly_return_cost.cost)
	respect_label.set_value(income_stream.weekly_return_cost.respect)
	completion_reward_control_view.set_cost(income_stream.completed_return_cost)
	percentage_label.set_percentage(income_stream.percent_chance_of_event)
	

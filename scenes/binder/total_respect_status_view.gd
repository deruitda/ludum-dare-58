extends VBoxContainer
class_name TotalRespectStatusView

@export var use_current_month: bool = false

@export var current_month_value: StatLabel
@export var current_respect_value: StatLabel
@export var needed_respect_next_month: StatLabel
@export var weeks_left_in_round: StatLabel
@export var money_label: StatLabel

@onready var current_respect_label_component: LabelComponent = $PerWeekControl/CurrentRespectValue/CurrentRespectLabelComponent

func _ready() -> void:
	refresh()
	SignalBus.week_changed.connect(refresh)
	SignalBus.respect_changed.connect(refresh)
	SignalBus.money_changed.connect(refresh)
	
func refresh():
	var current_month = GameManager.get_current_month()
	current_month_value.set_value(GameManager.get_current_month())
	var respect_threshold = GameManager.get_needed_total_respect(current_month)
	current_respect_label_component.neutral_threshold = respect_threshold
	current_respect_value.set_value(GameState.total_respect)
	
	needed_respect_next_month.set_value(respect_threshold)
	
	weeks_left_in_round.set_value(GameManager.get_weeks_left_in_period())
	money_label.set_value(GameState.total_money)
	

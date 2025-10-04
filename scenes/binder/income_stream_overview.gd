extends Node2D
class_name IncomeStreamOverview

@export var income_overview_grid: IncomeOverviewGrid
@export var total_money_label: Label
@export var forcasted_money_label: Label

func set_money_label(label: String) -> void:
	total_money_label.text = label

func set_forcasted_amount_label(label: String) -> void:
	forcasted_money_label.text = label
	
func set_income_streams(income_streams: Array[IncomeStream]) -> void:
	refresh()
	for income_stream in income_streams:
		income_overview_grid.add_row(income_stream)
func refresh() -> void:
	income_overview_grid.reset()

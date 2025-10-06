extends Node2D
class_name RunningReportPage

@onready var respect_gained_label: StatLabel = $RespectGainedLabel
@onready var money_gained_label: StatLabel = $MoneyGainedLabel

@onready var income_overview_grid: IncomeOverviewGrid = $IncomeOverviewGrid

func set_running_report(running_report: RunningReport):
	respect_gained_label.set_value(running_report.get_respect_difference())
	money_gained_label.set_value(running_report.get_money_difference())
	
	income_overview_grid.reset()
	for completed_income_streams in running_report.completed_income_streams:
		income_overview_grid.add_row(completed_income_streams)

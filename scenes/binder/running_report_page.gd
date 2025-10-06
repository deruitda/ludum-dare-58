extends Node2D
class_name RunningReportPage


@export var income_overview_grid: IncomeOverviewGrid

@export var report_overview: ReportOverview

func set_running_report(running_report: RunningReport):
	report_overview.set_running_report(running_report)
	
	if income_overview_grid:
		income_overview_grid.reset()
		for completed_income_streams in running_report.completed_income_streams:
			income_overview_grid.add_row(completed_income_streams)

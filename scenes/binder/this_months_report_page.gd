extends Node2D
class_name ThisMonthsReportPage

@export var report_overview: ReportOverview

func set_running_report(running_report: RunningReport):
	report_overview.set_running_report(running_report)

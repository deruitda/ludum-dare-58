extends Control
class_name ReportOverview

@export var respect_gained_label: StatLabel
@export var money_gained_label: StatLabel

func set_running_report(running_report: RunningReport):
	
	respect_gained_label.set_value(running_report.get_respect_difference())
	money_gained_label.set_value(running_report.get_money_difference())
	

extends Control
class_name SummaryIncomeStreamView

@onready var income_stream: IncomeStream

@onready var total_expenses_so_far_label: CostView = $PerWeekControl2/TotalExpensesSoFarLabel
@onready var total_return_so_far_label: CostView = $PerWeekControl/TotalReturnSoFarLabel

func set_income_stream(new_income_stream: IncomeStream):
	income_stream = new_income_stream
	var cost_manager = income_stream.get_total_so_far_cost_manager()
	
	total_expenses_so_far_label.set_cost(cost_manager.get_expense_cost())
	total_return_so_far_label.set_cost(cost_manager.get_income_cost())

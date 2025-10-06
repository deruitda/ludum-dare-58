extends Node
class_name CostManager

var total_cost: Cost = Cost.new()
var expense_cost: Cost = Cost.new()
var income_cost: Cost = Cost.new()

func add_cost(cost: Cost):
	total_cost.add_to_cost(cost)
	expense_cost.add_to_cost(cost.get_only_negative_cost())
	income_cost.add_to_cost(cost.get_only_positive_cost())

func get_total_cost() -> Cost:
	return total_cost
	
func get_expense_cost() -> Cost:
	return expense_cost
	
func get_income_cost() -> Cost:
	return income_cost

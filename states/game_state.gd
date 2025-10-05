extends Node

@onready var total_money: int = 500
@onready var total_respect: int = 0
@onready var current_week: int = 1

func spend_money(amount: int) -> void:
	total_money = total_money - amount
	SignalBus.money_changed.emit()
	
func collect_money(amount: int) -> void:
	total_money = total_money + amount
	SignalBus.money_changed.emit()

	
func get_level() -> int:
	if total_respect < 10:
		return 1
	elif total_respect < 20:
		return 2
	return 3

func gain_respect(amount: int) -> void:
	total_respect = total_respect + amount
	
func lose_respect(amount: int) -> void:
	total_respect = total_respect - amount

func increment_week() -> void:
	current_week = current_week + 1
#
func get_forecasted_expenses() -> int:
	return WorkerManager.get_forecasted_expenses()
	
func get_forecasted_income() -> int:
	return IncomeStreamManager.get_forecasted_income()

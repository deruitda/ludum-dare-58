extends Node

@onready var total_money: int = 500
@onready var total_respect: int = 0

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
	SignalBus.respect_changed.emit()

func collect_cost(cost: Cost) -> void:
	collect_money(cost.cost)
	gain_respect(cost.respect)

#
	
	
	

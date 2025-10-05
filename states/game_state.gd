extends Node

@onready var total_money: int = 10000
@onready var total_respect: int = 0
@onready var current_week: int = 1

func spend_money(amount: int) -> void:
	total_money = total_money - amount
	SignalBus.money_changed.emit(total_money)
	
func collect_money(amount: int) -> void:
	total_money = total_money + amount
	SignalBus.money_changed.emit(total_money)

func gain_respect(amount: int) -> void:
	total_respect = total_respect + amount
	
func lose_respect(amount: int) -> void:
	total_respect = total_respect - amount

func increment_week() -> void:
	current_week = current_week + 1
	SignalBus.week_changed.emit(current_week)
#
#func get_forcasted_expenses() -> int:
	#for 

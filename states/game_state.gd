extends Node

@onready var total_money: int = 10000
@onready var total_respect: int = 0
@onready var current_week: int = 1

@onready var candidate_manager: CandidateManager
@onready var worker_manager: WorkerManager

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

func simulate_events():
	var streams = ActiveIncomeStreamManager.get_income_streams()
	for stream in streams:
		stream.idle_event_chance()
		
	var idle_streams = ActiveIncomeStreamManager.get_idle_income_streams()
	
func progress_to_next_week():
	simulate_events()
	current_week = current_week + 1
	SignalBus.week_changed.emit(current_week)

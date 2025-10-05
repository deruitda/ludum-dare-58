extends Node
class_name RunningReport

@onready var completed_income_streams: Array[IncomeStream]
@onready var starting_money: int = 0
@onready var starting_respect: int = 0

func _ready() -> void:
	SignalBus.income_stream_completed.connect(_on_income_stream_completed)
	refresh()

func _on_income_stream_completed(income_stream: IncomeStream) -> void:
	completed_income_streams.push_back(income_stream)

func refresh():
	completed_income_streams.clear()
	starting_money = GameState.total_money
	starting_respect = GameState.total_respect
	
func get_money_difference() -> int:
	return starting_money - GameState.total_money

func get_respect_difference() -> int:
	return starting_respect - GameState.total_respect

extends Node2D
class_name IncomeStreamsPage

signal on_detail_button_press(income_stream: IncomeStream)
signal on_workers_button_press()

@export var income_overview_grid: IncomeOverviewGrid
@onready var total_money_label: StatLabel = $Control/TotalMoneyLabel
@onready var forcasted_income_amount_label: StatLabel = $Control/ForcastedIncomeAmountLabel
@onready var forcasted_expenses_amount_label: StatLabel = $Control/ForcastedExpensesAmountLabel

func _ready() -> void:
	IncomeStreamManager.income_stream_added.connect(_on_income_stream_added)
	WorkerManager.worker_hired.connect(_on_worker_hired)
	SignalBus.week_changed.connect(refresh)
	SignalBus.money_changed.connect(refresh)
	refresh()

func _on_income_stream_added(income_stream: IncomeStream) -> void:
	refresh()

func _on_worker_hired(worker: Worker):
	refresh()

func set_labels() -> void:
	total_money_label.set_value(GameState.total_money)
	forcasted_income_amount_label.set_value(GameManager.get_forecasted_income().cost)
	forcasted_expenses_amount_label.set_value(GameManager.get_forecasted_expenses().cost)
func set_income_streams(income_streams: Array[IncomeStream]) -> void:
	refresh()
	for income_stream in income_streams:
		income_overview_grid.add_row(income_stream)
func refresh() -> void:
	income_overview_grid.reset()
	for income_stream in IncomeStreamManager.get_current_income_streams():
		income_overview_grid.add_row(income_stream)
	set_labels()

func _on_overview_grid_on_detail_button_press(income_stream: IncomeStream) -> void:
	on_detail_button_press.emit(income_stream)

func _on_workers_button_button_up() -> void:
	on_workers_button_press.emit()

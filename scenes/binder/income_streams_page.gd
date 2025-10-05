extends Node2D
class_name IncomeStreamsPage

signal on_detail_button_press(income_stream: IncomeStream)
signal on_workers_button_press()

@export var income_overview_grid: IncomeOverviewGrid
@export var total_money_label: Label
@export var forcasted_money_label: Label

func _ready() -> void:
	IncomeStreamManager.income_stream_added.connect(_on_income_stream_added)

func _on_income_stream_added(income_stream: IncomeStream) -> void:
	refresh()

func set_money_label(label: String) -> void:
	total_money_label.text = label

func set_forcasted_amount_label(label: String) -> void:
	forcasted_money_label.text = label
	
func set_income_streams(income_streams: Array[IncomeStream]) -> void:
	refresh()
	for income_stream in income_streams:
		income_overview_grid.add_row(income_stream)
func refresh() -> void:
	income_overview_grid.reset()
	for income_stream in IncomeStreamManager.get_current_income_streams():
		income_overview_grid.add_row(income_stream)

func _on_overview_grid_on_detail_button_press(income_stream: IncomeStream) -> void:
	on_detail_button_press.emit(income_stream)


func _on_workers_button_button_up() -> void:
	on_workers_button_press.emit()

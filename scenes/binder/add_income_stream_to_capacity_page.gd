extends Control
class_name AddIncomeStreamToCapacityPage

@onready var income_overview_grid: IncomeOverviewGrid = $IncomeOverviewGrid
@onready var no_available_income_stream_control: Control = $NoAvailableIncomeStreamControl

@onready var worker: Worker

signal on_back_button_pressed
signal on_capacity_created

func load_page(p_worker: Worker):
	worker = p_worker
	load_income_streams()

func load_income_streams():
	income_overview_grid.visible = false
	no_available_income_stream_control.visible = false
	income_overview_grid.reset()
	var income_streams = IncomeStreamManager.get_current_income_streams()
	var has_workers = false
	for income_stream in income_streams:
		if not income_stream.has_full_capacity() and not worker.is_working_income_stream(income_stream):
			income_overview_grid.add_row(income_stream)
			has_workers = true
	if has_workers:
		income_overview_grid.visible = true
	else:
		no_available_income_stream_control.visible = true

func _on_back_button_button_up() -> void:
	on_back_button_pressed.emit()

func _on_income_overview_grid_on_detail_button_press(income_stream: IncomeStream) -> void:
	CapacityManager.create_capacity(income_stream, worker)
	on_capacity_created.emit()

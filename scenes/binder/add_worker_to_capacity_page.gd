extends Control
class_name AddWorkerToCapacityPage

@onready var worker_overview_grid: WorkerOverviewGrid = $WorkerOverviewGrid

@onready var income_stream: IncomeStream

signal on_back_button_pressed
signal on_capacity_created

func load_page(p_income_stream: IncomeStream):
	income_stream = p_income_stream
	load_workers()

func load_workers():
	worker_overview_grid.reset()
	var workers = WorkerManager.get_workers()
	for worker in workers:
		if not worker.has_full_capacity() and not worker.is_working_income_stream(income_stream):
			worker_overview_grid.add_row(worker)


func _on_back_button_button_up() -> void:
	on_back_button_pressed.emit()

func _on_worker_overview_grid_on_details_button_pressed(worker: Worker) -> void:
	CapacityManager.create_capacity(income_stream, worker)
	on_capacity_created.emit()

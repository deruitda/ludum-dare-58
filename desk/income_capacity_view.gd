extends Control
class_name IncomeCapacityView

signal worker_selected

@export var worker_overview_grid: WorkerOverviewGrid 

@onready var income_stream: IncomeStream
@onready var capacity: Capacity
@onready var worker_manager: WorkerManager


func set_worker_manager(new_worker_manager: WorkerManager):
	worker_manager = new_worker_manager
	
func set_income_stream_and_capacity(new_income_stream: IncomeStream, new_capacity: Capacity) -> void:
	income_stream = new_income_stream
	capacity = new_capacity
	set_worker_overview_grid()
	
func set_worker_overview_grid() -> void:
	worker_overview_grid.reset()
	for worker in worker_manager.get_workers():
		worker_overview_grid.add_row(worker)


func _on_worker_overview_grid_on_details_button_pressed(worker: Worker) -> void:
	capacity.set_worker(worker)
	worker_selected.emit()

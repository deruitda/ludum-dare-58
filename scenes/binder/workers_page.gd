extends Node2D
class_name WorkersPage

@onready var this_weeks_respect_value: Label = $Control/ThisWeeksRespectValue
@onready var total_respect_value: Label = $Control/TotalRespectValue
@onready var level_value: Label = $Control/LevelValue

@onready var worker_overview_grid: WorkerOverviewGrid = $Control/Control/WorkerOverviewGrid

signal on_open_worker_page_button_pressed(worker: Worker)

func _ready() -> void:
	WorkerManager.worker_hired.connect(_on_worker_hired)

func _on_worker_hired(worker: Worker):
	refresh()

func refresh():
	this_weeks_respect_value.text = str(WorkerManager.get_forecasted_respect())
	total_respect_value.text = str(GameState.total_respect)
	level_value.text = str(GameState.get_level())
	worker_overview_grid.reset()
	for worker in WorkerManager.get_workers():
		worker_overview_grid.add_row(worker)


func _on_worker_overview_grid_on_details_button_pressed(worker: Worker) -> void:
	on_open_worker_page_button_pressed.emit(worker)
	pass # Replace with function body.

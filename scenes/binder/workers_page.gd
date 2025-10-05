extends Node2D
class_name WorkersPage

@onready var this_weeks_respect_value: Label = $Control/ThisWeeksRespectValue
@onready var total_respect_value: Label = $Control/TotalRespectValue
@onready var level_value: Label = $Control/LevelValue

@onready var scroll_container: WorkerOverviewGrid = $Control/Control/ScrollContainer

func _ready() -> void:
	WorkerManager.worker_hired.connect(_on_worker_hired)

func _on_worker_hired(worker: Worker):
	refresh()

func refresh():
	this_weeks_respect_value.text = str(WorkerManager.get_forecasted_respect())
	total_respect_value.text = str(GameState.total_respect)
	level_value.text = str(GameState.get_level())
	scroll_container.reset()
	for worker in WorkerManager.get_workers():
		scroll_container.add_row(worker)

extends Control
class_name AddWorkerToCapacityPage

@onready var worker_overview_grid: WorkerOverviewGrid = $WorkerOverviewGrid


func set(income_stream: IncomeStream, capacity: Capacity) -> void:
	load_workers()

func load_workers():
	worker_overview_grid.reset()
	var workers = WorkerManager.get_workers()
	for worker in workers:
		worker_overview_grid.add_row(worker)

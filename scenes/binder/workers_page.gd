extends Node2D
class_name WorkersPage

@onready var scroll_container: WorkerOverviewGrid = $Control/Control/ScrollContainer

func refresh():
	scroll_container.reset()
	for worker in WorkerManager.get_workers():
		scroll_container.add_row(worker)

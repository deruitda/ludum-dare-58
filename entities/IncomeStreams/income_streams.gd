extends Node

class_name IncomeStream

@export var income_stream_name: String = ""
@export var cost: int = 100
@export var capacity: int = 1
@export var duration_in_weeks: int = 10
@export var accepted_worker_types: Array = []

@onready var currentWorkers: Array[Worker] = []

func add_worker(worker: Worker) -> void:
	if  capacity > len(currentWorkers):
		currentWorkers.append(worker)
		
	

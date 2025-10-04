extends Node2D

@onready var candidate_manager: CandidateManager = $CandidateManager
@onready var worker_manager: WorkerManager = $WorkerManager

func _ready() -> void:
	candidate_manager.generate_worker()
	candidate_manager.generate_worker()
	candidate_manager.generate_worker()
	
	#var worker = candidate_manager.hire_worker_by_index(0)
	#
	#
	#worker_manager.hire_worker(worker)
	#
	#var hierable_workers = candidate_manager.get_hierable_workers()
	#print(len(hierable_workers))
	

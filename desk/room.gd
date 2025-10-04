extends Node2D
class_name Room

@export var candidate_manager: CandidateManager
@export var worker_manager: WorkerManager

func _ready() -> void:
	candidate_manager.generate_worker()
	candidate_manager.generate_worker()
	candidate_manager.generate_worker()
	

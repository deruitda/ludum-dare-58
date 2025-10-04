extends Node2D
class_name Room

@export var candidate_manager: CandidateManager
@export var worker_manager: WorkerManager
@export var resumes: Resumes

func _ready() -> void:
	resumes.set_candidate_manager(candidate_manager)

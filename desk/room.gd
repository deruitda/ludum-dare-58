extends Node2D
class_name Room

@export var candidate_manager: CandidateManager
@export var worker_manager: WorkerManager
@export var resumes: Resumes
@export var phone: Phone

signal progress_button_click()

func _ready() -> void:
	resumes.set_candidate_manager(candidate_manager)
	phone.set_worker_manager(worker_manager)


func _on_progress_button_click() -> void:
	progress_button_click.emit()
	pass # Replace with function body.

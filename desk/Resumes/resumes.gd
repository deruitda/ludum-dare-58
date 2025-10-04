extends Node2D
class_name Resumes
@onready var candidate_manager: CandidateManager
@export var resume: Resume

@onready var current_index: int = 0
@onready var initialized: bool = false

func set_candidate_manager(cm: CandidateManager) -> void:
	candidate_manager = cm
	candidate_manager.worker_generated.connect(worker_generated)
	if candidate_manager.get_number_of_hierable_workers() > 0:
		resume.set_worker(candidate_manager.get_hierable_workers()[0])
		initialized = true
	
func worker_generated(worker: Worker) -> void:
	if not initialized:
		resume.set_worker(worker)
		initialized = true


func _on_left_pressed() -> void:
	var number_of_hireable_workers = candidate_manager.get_number_of_hierable_workers()
	if current_index == 0:
		current_index = number_of_hireable_workers - 1
	else:
		current_index = current_index - 1
	resume.set_worker(candidate_manager.get_hierable_workers()[current_index])



func _on_right_pressed() -> void:
	var number_of_hireable_workers = candidate_manager.get_number_of_hierable_workers()
	if current_index == number_of_hireable_workers - 1:
		current_index = 0
	else:
		current_index = current_index + 1
	resume.set_worker(candidate_manager.get_hierable_workers()[current_index])


func _on_resume_on_hire_button_pressed() -> void:
	candidate_manager.hire_worker_by_index(current_index)
	var number_of_hireable_workers = candidate_manager.get_number_of_hierable_workers()
	
	if number_of_hireable_workers == 0:
		resume.set_no_resumes_left_screen()
		return 
		
	if candidate_manager.get_number_of_hierable_workers() == current_index:
		current_index = current_index - 1
	resume.set_worker(candidate_manager.get_hierable_workers()[current_index])
	

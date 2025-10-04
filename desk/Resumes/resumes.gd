extends Node2D
class_name Resumes
@onready var candidate_manager: CandidateManager

@export var paginator: Paginator
@export var resume: Resume

@onready var current_index: int = 0
@onready var initialized: bool = false

func set_candidate_manager(cm: CandidateManager) -> void:
	candidate_manager = cm
	candidate_manager.worker_generated.connect(worker_generated)
	candidate_manager.worker_hired.connect(worker_hired)
	set_items()
	
func set_items() -> void:
	var workers = candidate_manager.get_hierable_workers()
	paginator.set_items(workers)

func set_worker_on_resume() -> void:
	var has_items = paginator.has_items()
	if paginator.has_items():
		resume.set_worker(paginator.get_current_item() as Worker)


func worker_generated(worker: Worker) -> void:
	set_items()
	if not initialized:
		set_worker_on_resume()
		
func worker_hired(worker: Worker) -> void:
	set_items()
	set_worker_on_resume()

func _on_left_pressed() -> void:
	paginator.paginate_left()
	set_worker_on_resume()

func _on_right_pressed() -> void:
	paginator.paginate_left()
	set_worker_on_resume()

func _on_resume_on_hire_button_pressed(worker: Worker) -> void:
	print('hiya')
	candidate_manager.hire_worker_by_index(paginator.current_index)
	set_items()
	if not paginator.has_items():
		resume.set_no_resumes_left_screen()
	else:
		set_worker_on_resume()

	
	

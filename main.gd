extends Node2D
const ROOM = preload("uid://bpa13iucdr4gj")

func _ready() -> void:
	
	var room = ROOM.instantiate()
	add_child(room)
	
	CandidateManager.worker_hired.connect(_on_candidate_manager_worker_hired)
	PotentialIncomeStreamManager.income_stream_accepted.connect(_on_potential_income_stream_manager_income_stream_accepted)
	CandidateManager.generate_worker()
	CandidateManager.generate_worker()
	
	PotentialIncomeStreamManager.generate_income_stream()
	PotentialIncomeStreamManager.generate_income_stream()

func _on_button_button_up() -> void:
	pass # Replace with function body.


func _on_candidate_manager_worker_hired(worker: Worker) -> void:
	WorkerManager.hire_worker(worker)

func _on_potential_income_stream_manager_income_stream_accepted(income_stream: IncomeStream) -> void:
	IncomeStreamManager.accept_income_stream(income_stream)

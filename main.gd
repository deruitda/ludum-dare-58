extends Node2D
@export var candidate_manager: CandidateManager
@export var worker_manager: WorkerManager
@export var potential_income_stream_manager: PotentialIncomeStreamsManager
@export var active_income_streams_manager: ActiveIncomeStreamsManager

func _ready() -> void:
	candidate_manager.generate_worker()
	candidate_manager.generate_worker()
	candidate_manager.generate_worker()
	
	potential_income_stream_manager.generate_income_stream()
	potential_income_stream_manager.generate_income_stream()
	potential_income_stream_manager.generate_income_stream()
func _on_button_button_up() -> void:
	
	pass # Replace with function body.


func _on_candidate_manager_worker_hired(worker: Worker) -> void:
	worker_manager.hire_worker(worker)

func _on_potential_income_stream_manager_income_stream_accepted(income_stream: IncomeStream) -> void:
	active_income_streams_manager.accept_income_stream(income_stream)

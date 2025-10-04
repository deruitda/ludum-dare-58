extends Node2D
class_name neshTest

@onready var candidate_manager: CandidateManager = $CandidateManager
@onready var worker_manager: WorkerManager = $WorkerManager
@onready var potential_income_stream_manager: PotentialIncomeStreamsManager = $PotentialIncomeStreamManager
@onready var accepted_income_stream_manager: AcceptedIncomeStreamsManager = $AcceptedIncomeStreamManager

func _ready() -> void:
	print('test')
	candidate_manager.generate_worker()
	candidate_manager.generate_worker()
	candidate_manager.generate_worker()
	

	
	var hierable_workers = candidate_manager.get_hierable_workers()
	print(len(hierable_workers))
	
	potential_income_stream_manager.generate_income_stream()
	potential_income_stream_manager.generate_income_stream()
	potential_income_stream_manager.generate_income_stream()
	potential_income_stream_manager.generate_income_stream()
	var income_stream = potential_income_stream_manager.accept_income_stream_by_index(0)
	
	accepted_income_stream_manager.accept_income_stream(income_stream)
	
	var potential_income_streams = potential_income_stream_manager.get_potential_income_streams()
	print(len(potential_income_streams))
	
	var selected_worker = worker_manager.get_worker_by_index(1)
	var selected_income_stream = accepted_income_stream_manager.get_income_stream_by_index(1)

	
	selected_income_stream.add_worker(selected_worker)
	
	print(selected_income_stream.currentWorkers)

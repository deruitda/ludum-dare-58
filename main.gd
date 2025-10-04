extends Node2D
@export var candidate_manager: CandidateManager
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

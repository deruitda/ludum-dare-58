extends Node
class_name GameManager

@export var candidate_manager: CandidateManager
@export var worker_manager: WorkerManager

func _on_room_progress_button_click() -> void:
	candidate_manager.generate_worker()
	candidate_manager.generate_worker()
	
	for worker in worker_manager.get_workers():
		GameState.spend_money(worker.cost_per_week)
	
	GameState.progress_to_next_week()

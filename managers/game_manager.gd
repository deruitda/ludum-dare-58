extends Node

func _on_room_progress_button_click() -> void:
	pass

func simulate_events():
	var streams = IncomeStreamManager.get_income_streams()
	for stream in streams:
		stream.idle_event_chance()
	
func progress_to_next_week():
	
	for income_streams in IncomeStreamManager.get_in_progress_income_streams():
		GameState.collect_money(income_streams.income_per_week)
	
	for worker in WorkerManager.get_workers():
		GameState.spend_money(worker.cost_per_week)
	
	# remove completed jobs
	
	simulate_events()
	
	# refresh potential jobs and resumes
	
	
	GameState.increment_week()

extends Node

func _on_room_progress_button_click() -> void:
	pass

func simulate_events():
	var streams = IncomeStreamManager.get_income_streams()
	for stream in streams:
		stream.idle_event_chance()
	
func progress_to_next_week():
	
	for income_stream in IncomeStreamManager.get_active_income_streams():
		GameState.collect_money(income_stream.income_per_week)
		income_stream.increment_week()
		if income_stream.is_completed():
			pass
		
	
	for worker in WorkerManager.get_workers():
		GameState.spend_money(worker.cost_per_week)
		var current_level = worker.get_level()
		worker.gain_experience()
		var new_level = worker.get_level()
		if new_level > current_level:
			pass
		
	
	# remove completed jobs
	
	simulate_events()
	
	
	
	
	GameState.increment_week()

extends Node

signal worker_fired

@export var number_of_potential_income_streams_per_week: int = 2
@export var number_of_candidates_per_week: int = 2

@export var running_report: RunningReport
@onready var running_reports: Node

@export var time_manager: TimeManager

func _ready() -> void:
	running_report = RunningReport.new()
	add_child(running_report)
	
	time_manager = TimeManager.new()
	add_child(time_manager)
	
	time_manager.on_current_week_incremented.connect(_on_time_manager_current_week_incremented)
	time_manager.on_current_month_incremented.connect(_on_time_manager_current_month_incremented)

func _on_time_manager_current_week_incremented() -> void:
	SignalBus.week_changed.emit()

func _on_time_manager_current_month_incremented() -> void:
	SignalBus.month_changed.emit()
	
func get_weeks_left_in_period() -> int:
	return time_manager.get_weeks_left_in_month()

func get_current_week() -> int:
	return time_manager.current_week

func get_current_month() -> int:
	return time_manager.current_month
	
func _on_room_progress_button_click() -> void:
	pass

func fire_worker(worker: Worker):
	WorkerManager.remove_worker(worker)
	worker_fired.emit()

func simulate_events():
	var streams = IncomeStreamManager.get_active_income_streams()
	for stream in streams:
		if stream.roll_dice_for_event():
			stream.create_random_idle_event()
			
func has_report() -> bool:
	return GameState.current_week > 1

func progress_to_next_week():
	simulate_events()
	
	for income_stream in IncomeStreamManager.get_active_income_streams():
		GameState.collect_cost(income_stream.weekly_return_cost)
		income_stream.increment_week()
		if income_stream.is_completed():
			GameState.collect_cost(income_stream.completed_return_cost)
			income_stream.remove_all_workers()
			SignalBus.income_stream_completed.emit(income_stream)
			pass
	
	for worker in WorkerManager.get_workers():
		GameState.spend_money(worker.get_cost_per_week())
		GameState.gain_respect(worker.get_current_weekly_respect_amount())
		var current_level = worker.get_level()
		worker.gain_experience()
		var new_level = worker.get_level()
		if new_level > current_level:
			pass
	
	
	PotentialIncomeStreamManager.remove_all_income_streams()
	CandidateManager.remove_all_candidates()
	
	for i in number_of_potential_income_streams_per_week:
		PotentialIncomeStreamManager.generate_income_stream()
	
	for i in number_of_candidates_per_week:
		CandidateManager.generate_worker()
	
	time_manager.increment_week()
	
	SignalBus.on_week_report_publish.emit(running_report)
	running_report.refresh()
	

func get_forecasted_cost() -> Cost:
	var return_cost = Cost.new()
	return_cost.add_to_cost(WorkerManager.get_forecasted_cost())
	return_cost.add_to_cost(IncomeStreamManager.get_forecasted_cost())
	return return_cost

func get_forecasted_expenses() -> Cost:
	var return_cost = Cost.new()
	return_cost.add_to_cost(WorkerManager.get_forecasted_expenses())
	return_cost.add_to_cost(IncomeStreamManager.get_forecasted_expense())
	
	return return_cost
	
func get_forecasted_income() -> Cost:
	var return_cost = Cost.new()
	return_cost.add_to_cost(WorkerManager.get_forecasted_income())
	return_cost.add_to_cost(IncomeStreamManager.get_forecasted_income())
	
	return return_cost

func get_needed_total_respect(current_month: int) -> int:
	var base_respect = 5.0
	var growth_factor = 1.5
	return int(base_respect * pow(growth_factor, current_month - 1))

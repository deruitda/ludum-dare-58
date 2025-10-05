extends Node

signal worker_fired

@export var number_of_potential_income_streams_per_week: int = 3
@export var number_of_candidates_per_week: int = 3

@export var running_report: RunningReport
@onready var running_reports: Node
const RUNNING_REPORT = preload("uid://brielx5y15lvf")

func _ready() -> void:
	running_report = RUNNING_REPORT.instantiate()
	add_child(running_report)
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

func progress_to_next_week():
	for income_stream in IncomeStreamManager.get_active_income_streams():
		GameState.collect_money(income_stream.income_per_week)
		income_stream.increment_week()
		if income_stream.is_completed():
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
	
	simulate_events()
	
	PotentialIncomeStreamManager.remove_all_income_streams()
	CandidateManager.remove_all_candidates()
	
	for i in number_of_potential_income_streams_per_week:
		PotentialIncomeStreamManager.generate_income_stream()
	
	for i in number_of_candidates_per_week:
		CandidateManager.generate_worker()
	
	GameState.increment_week()
	SignalBus.week_changed.emit()
	SignalBus.on_week_report_publish.emit(running_report)
	running_report.refresh()

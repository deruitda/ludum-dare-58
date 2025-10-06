extends Control
class_name IndividualIncomeStreamPage

@onready var income_stream: IncomeStream

@export var income_stream_view: IncomeStreamView
@export var summary_income_stream_view: SummaryIncomeStreamView
@export var capacity_row: CapacityRow
@export var idle_event_view: IdleEventView

@export var resolution_failed_label: Label
@export var resolution_successful_label: Label


signal capacity_button_pressed(income_stream: IncomeStream)
signal back_button_pressed()


func _ready() -> void:
	WorkerManager.worker_hired.connect(_on_worker_hired)

func _on_worker_hired(worker: Worker) -> void:
	refresh()

func set_income_stream(new_income_stream: IncomeStream) -> void:
	income_stream = new_income_stream
	refresh()

func refresh():
	resolution_failed_label.visible = false
	resolution_successful_label.visible = false
	idle_event_view.visible = false

	if income_stream == null:
		return
	income_stream_view.set_income_stream(income_stream)
	summary_income_stream_view.set_income_stream(income_stream)
	capacity_row.set_income_stream(income_stream)
	if income_stream.has_idle_event():
		if income_stream.idle_event_manager.has_attempted_success_this_week:
			resolution_failed_label.visible = true
		else:
			idle_event_view.set_idle_event(income_stream.get_idle_event())
			idle_event_view.visible = true
	elif income_stream.has_idle_event() == false and income_stream.idle_event_manager.has_attempted_success_this_week:
		resolution_successful_label.visible = true
		resolution_successful_label.text = income_stream.idle_event_manager.attempt_successful_message
	else:
		idle_event_view.visible = false
	

func refresh_capacity_state() -> void:
	capacity_row.refresh_capacity_state()

func _on_back_button_button_up() -> void:
	back_button_pressed.emit()

func _on_idle_event_view_on_abandon_button_pressed() -> void:
	GameState.collect_cost(income_stream.get_idle_event().abandon_cost)
	IncomeStreamManager.abandon_income_stream(income_stream)
	back_button_pressed.emit()

func _on_idle_event_view_on_attempt_to_resolve_button_pressed() -> void:
	var idle_event = income_stream.get_idle_event()
	resolution_failed_label.text = idle_event.attempt_failed_message
	resolution_successful_label.text = idle_event.attempt_successful_message
	
	GameState.collect_cost(income_stream.get_idle_event().attempt_to_resolve_cost)
	income_stream.attempt_to_resolve_idle_event()
	idle_event_view.visible = false
	if income_stream.has_idle_event():
		resolution_failed_label.visible = true
	else:
		resolution_successful_label.visible = true

func _on_capacity_row_on_assign_workers_button_pressed() -> void:
	capacity_button_pressed.emit(income_stream)

func _on_capacity_row_on_unassign_workers_button_pressed() -> void:
	income_stream.remove_all_workers()
	refresh()

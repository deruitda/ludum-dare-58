extends Node2D
class_name ActiveIncomeStreamBinder
@export var no_jobs_available_control: Control
@onready var active_income_streams_manager: ActiveIncomeStreamsManager
@export var income_stream_overview: IncomeStreamOverview
@export var income_stream_detail: IncomeStreamDetail
@export var income_capacity_view: IncomeCapacityView

@onready var worker_manager: WorkerManager

func set_active_income_stream_manager(stream_manager: ActiveIncomeStreamsManager) -> void:
	active_income_streams_manager = stream_manager
	active_income_streams_manager.active_income_stream_added.connect(_on_income_stream_added)
	set_items()

func set_worker_manager(new_worker_manager: WorkerManager):
	worker_manager = new_worker_manager
	income_capacity_view.set_worker_manager(worker_manager)
	

func _on_income_stream_added(income_stream: IncomeStream) -> void:
	set_items()
	set_income_stream_view()

func set_items() -> void:
	var income_streams = active_income_streams_manager.get_income_streams()
	if len(income_streams) > 0:
		income_stream_overview.visible = true
		no_jobs_available_control.visible = false
	else:
		income_stream_overview.visible = false
		no_jobs_available_control.visible = true
	
func set_income_stream_view() -> void:
	income_stream_overview.set_income_streams(active_income_streams_manager.get_income_streams())

func _on_income_stream_overview_on_detail_button_press(income_stream: IncomeStream) -> void:
	income_stream_detail.set_income_stream(income_stream)
	income_stream_overview.visible = false
	income_stream_detail.visible = true


func _on_income_stream_detail_capacity_button_pressed(capacity: Capacity) -> void:
	income_capacity_view.set_income_stream_and_capacity(income_stream_detail.income_stream, capacity)
	income_capacity_view.visible = true
	pass # Replace with function body.


func _on_income_capacity_view_worker_selected() -> void:
	income_stream_detail.refresh_capacity_state()
	income_capacity_view.visible = false
	pass # Replace with function body.


func _on_income_stream_detail_back_button_pressed() -> void:
	income_stream_detail.visible = false
	income_stream_overview.visible = true

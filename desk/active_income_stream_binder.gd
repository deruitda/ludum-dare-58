extends Node2D
class_name ActiveIncomeStreamBinder
@export var paginator: Paginator
@export var no_jobs_available_control: Control
@export var jobs_available_control: Control
@onready var active_income_streams_manager: ActiveIncomeStreamsManager
@export var income_stream_view: IncomeStreamView

func set_active_income_stream_manager(stream_manager: ActiveIncomeStreamsManager) -> void:
	active_income_streams_manager = stream_manager
	active_income_streams_manager.active_income_stream_added.connect(_on_income_stream_added)
	set_items()


func _on_income_stream_added(income_stream: IncomeStream) -> void:
	set_items()
	set_income_stream_view()

func set_items() -> void:
	var income_streams = active_income_streams_manager.get_income_streams()
	paginator.set_items(income_streams)
	if not paginator.has_items():
		no_jobs_available_control.visible = true
		jobs_available_control.visible = false
	else:
		no_jobs_available_control.visible = false
		jobs_available_control.visible = true
	
func set_income_stream_view() -> void:
	var has_items = paginator.has_items()
	if paginator.has_items():
		income_stream_view.set_income_stream(paginator.get_current_item() as IncomeStream)
 

func _on_left_pressed() -> void:
	paginator.paginate_left()
	set_income_stream_view()

func _on_right_pressed() -> void:
	paginator.paginate_left()
	set_income_stream_view()
	

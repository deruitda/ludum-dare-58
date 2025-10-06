extends Node2D
class_name PotentialIncomeStreamBinder
@export var paginator: Paginator
@export var no_jobs_available_control: Control
@export var jobs_available_control: Control
@onready var potential_income_stream_view: PotentialIncomeStreamView = $JobsAvailableControl/PotentialIncomeStreamView

func _ready() -> void:
	PotentialIncomeStreamManager.income_stream_accepted.connect(_on_income_stream_accepted)
	PotentialIncomeStreamManager.potential_income_stream_generated.connect(_on_potential_income_stream_generated)
	set_items()

func _on_potential_income_stream_generated(income_stream: IncomeStream) -> void:
	set_items()

func _on_income_stream_accepted(income_stream: IncomeStream) -> void:
	set_items()

func _on_left_pressed() -> void:
	paginator.paginate_left()
	set_income_stream_view()

func _on_right_pressed() -> void:
	paginator.paginate_left()
	set_income_stream_view()
	
func set_items() -> void:
	var potential_income_streams = PotentialIncomeStreamManager.get_potential_income_streams()
	paginator.set_items(potential_income_streams)
	if not paginator.has_items():
		no_jobs_available_control.visible = true
		jobs_available_control.visible = false
	else:
		no_jobs_available_control.visible = false
		jobs_available_control.visible = true
		set_income_stream_view()
		
func set_income_stream_view() -> void:
	var has_items = paginator.has_items()
	if paginator.has_items():
		potential_income_stream_view.set_income_stream(paginator.get_current_item() as IncomeStream)

func _on_accept_income_stream_button_button_up() -> void:
	PotentialIncomeStreamManager.accept_income_stream_by_index(paginator.current_index)

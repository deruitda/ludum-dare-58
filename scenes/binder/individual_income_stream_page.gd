extends Control
class_name IndividualIncomeStreamPage

@onready var income_stream: IncomeStream
@export var capacity_row: CapacityRow
@onready var idle_event_view: IdleEventView = $VBoxContainer/IdleEventView

signal capacity_button_pressed(income_stream: IncomeStream)
signal back_button_pressed()

func _ready() -> void:
	WorkerManager.worker_hired.connect(refresh)

func set_income_stream(new_income_stream: IncomeStream) -> void:
	income_stream = new_income_stream
	refresh()

func refresh():
	if income_stream == null:
		return
	capacity_row.set_income_stream(income_stream)
	if income_stream.has_idle_event():
		idle_event_view.visible = true
	else:
		idle_event_view.visible = false

func refresh_capacity_state() -> void:
	capacity_row.refresh_capacity_state()

func _on_capacity_row_capacity_button_pressed() -> void:
	capacity_button_pressed.emit(income_stream)

func _on_back_button_button_up() -> void:
	back_button_pressed.emit()

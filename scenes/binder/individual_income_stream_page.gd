extends Control
class_name IndividualIncomeStreamPage

@onready var income_stream: IncomeStream
@export var capacity_row: CapacityRow

signal capacity_button_pressed(capacity: Capacity)
signal back_button_pressed()

func set_income_stream(new_income_stream: IncomeStream) -> void:
	income_stream = new_income_stream
	capacity_row.set_income_stream(new_income_stream)

func refresh_capacity_state() -> void:
	capacity_row.refresh_capacity_state()

func _on_capacity_row_capacity_button_pressed(capacity: Capacity) -> void:
	capacity_button_pressed.emit(capacity)


func _on_back_button_button_up() -> void:
	back_button_pressed.emit()

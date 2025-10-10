extends Control
class_name CapacityRow
@onready var unassign_workers_button: TextureButton = $UnassignWorkersButton
@onready var assign_workers_button: TextureButton = $AssignWorkersButton

@onready var income_stream: IncomeStream
@onready var capacity_label: CapacityLabel = $HBoxContainer/CapacityLabel

signal on_unassign_workers_button_pressed
signal on_assign_workers_button_pressed

func set_income_stream(new_income_stream: IncomeStream) -> void:
	income_stream = new_income_stream
	refresh_capacity_state()

func refresh_capacity_state() -> void:
	unassign_workers_button.visible = false
	assign_workers_button.visible = false
	var current_capacity = income_stream.get_current_capacity()
	var capacity_value = CapacityValue.new()
	
	capacity_value.current_val = income_stream.get_current_capacity()
	capacity_value.total_val = income_stream.capacity
	capacity_label.set_capacity_value(capacity_value)
	
	if not income_stream.has_full_capacity():
		assign_workers_button.visible = true
	if current_capacity > 0:
		unassign_workers_button.visible = true

func _on_unassign_workers_button_button_up() -> void:
	on_unassign_workers_button_pressed.emit()

func _on_assign_workers_button_button_up() -> void:
	on_assign_workers_button_pressed.emit()

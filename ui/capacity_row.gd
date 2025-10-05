extends Control
class_name CapacityRow
@onready var capacity_label: Label = $CapacityLabel
@onready var unassign_workers_button: Button = $UnassignWorkersButton
@onready var assign_workers_button: Button = $AssignWorkersButton

@onready var income_stream: IncomeStream

signal on_unassign_workers_button_pressed
signal on_assign_workers_button_pressed

func set_income_stream(new_income_stream: IncomeStream) -> void:
	income_stream = new_income_stream
	refresh_capacity_state()

func refresh_capacity_state() -> void:
	unassign_workers_button.visible = false
	assign_workers_button.visible = false
	var current_capacity = income_stream.get_current_capacity()
	
	capacity_label.text = str(current_capacity) + "/" + str(income_stream.capacity) + " Necessary Capacity Filled"
	if not income_stream.has_full_capacity():
		assign_workers_button.visible = true
	if current_capacity > 0:
		unassign_workers_button.visible = true

func _on_unassign_workers_button_button_up() -> void:
	on_unassign_workers_button_pressed.emit()

func _on_assign_workers_button_button_up() -> void:
	on_assign_workers_button_pressed.emit()

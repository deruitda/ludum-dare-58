extends Control
class_name CapacityButton
@onready var capacity: Capacity
@onready var taken_label: Label = $TakenLabel
@onready var not_taken_label: Label = $NotTakenLabel

signal on_capacity_button_press(capacity: Capacity)

func set_is_taken(is_taken: bool):
	if is_taken:
		taken_label.visible = true
		not_taken_label.visible = false
	else:
		taken_label.visible = false
		not_taken_label.visible = true


func _on_button_up() -> void:
	print("capacity button")
	on_capacity_button_press.emit(capacity)

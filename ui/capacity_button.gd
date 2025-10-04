extends Button
class_name CapacityButton
@onready var taken_label: Label = $ColorRect/TakenLabel
@onready var not_taken_label: Label = $ColorRect/NotTakenLabel

func set_is_taken(is_taken: bool):
	if is_taken:
		taken_label.visible = true
		not_taken_label.visible = false
	else:
		taken_label.visible = false
		not_taken_label.visible = true

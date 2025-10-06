extends Label
class_name StatLabel
@export var label_component: LabelComponent
\
func set_value(value: int) -> void:
	text = label_component.get_label_from_int(value)
	if value > label_component.neutral_threshold:
		label_settings = label_component.positive_label_settings
	elif value < label_component.neutral_threshold:
		label_settings = label_component.negative_label_settings
	else:
		label_settings = label_component.neutral_label_settings
	

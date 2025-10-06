extends Label
class_name StatLabel
@export var label_component: LabelComponent
@export var use_tooltip: bool = false
@export var tooltip_suffix: String = ""

func set_value(value: int) -> void:
	text = label_component.get_label_from_int(value)
	if value > label_component.neutral_threshold:
		label_settings = label_component.positive_label_settings
		if use_tooltip:
			tooltip_text = "Gain " + text + tooltip_suffix
	elif value < label_component.neutral_threshold:
		label_settings = label_component.negative_label_settings
		if use_tooltip:
			tooltip_text = "Lose " + text + tooltip_suffix
	else:
		label_settings = label_component.neutral_label_settings
	

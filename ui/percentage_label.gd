extends Label
class_name PercentageLabel

@export var high_is_bad: bool = false
@export var danger_threshold: float = .35
@export var caution_threshold: float = .65

@export var danger_label_settings: LabelSettings = preload("uid://di5o3x4joi7mt")
@export var caution_label_settings: LabelSettings = preload("uid://djkpwc0lasqli")
@export var happy_label_settings: LabelSettings = preload("uid://d0ai4x5b6g57f")

func set_percentage(percentage: float):
	text = str(percentage) + "%"
	var value = percentage
	if high_is_bad:
		value = 1 - value
	if value < danger_threshold:
		label_settings = danger_label_settings
	elif value < caution_threshold:
		label_settings = caution_label_settings
	
	label_settings = happy_label_settings
		

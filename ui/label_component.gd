extends Node
class_name LabelComponent

@export var prepend_string: String = "$"
@export var positive_label_settings: LabelSettings
@export var negative_label_settings: LabelSettings = preload("uid://di5o3x4joi7mt")
@export var neutral_label_settings: LabelSettings = preload("uid://djkpwc0lasqli")

@export var use_plus_sign_in_label: bool = true

func get_label_from_int(value: int):
	if value > 0:
		var positive_label_prepend = ""
		if use_plus_sign_in_label:
			positive_label_prepend = "+"
		return positive_label_prepend + prepend_string + str(value)
	elif value < 0:
		return "(" + prepend_string + str(abs(value)) + ")"
	
	return prepend_string + "0"

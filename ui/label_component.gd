extends Node
class_name LabelComponent

@export var prepend_string: String = "$"
@export var positive_label_settings: LabelSettings
@export var negative_label_settings: LabelSettings = preload("uid://di5o3x4joi7mt")
@export var neutral_label_settings: LabelSettings = preload("uid://djkpwc0lasqli")

@export var use_plus_sign_in_label: bool = true
@export var use_paranthesis: bool = true
@export var neutral_threshold: int = 0

func get_label_from_int(value: int):
	if value > neutral_threshold:
		var positive_label_prepend = ""
		if use_plus_sign_in_label:
			positive_label_prepend = "+"
		return positive_label_prepend + prepend_string + str(value)
	elif value < neutral_threshold:
		var return_label = prepend_string + str(value)
		if use_paranthesis:
			return "(" + return_label + ")"
		else:
			return return_label
	
	return prepend_string + str(neutral_threshold)

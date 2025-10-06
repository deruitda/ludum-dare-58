extends Node
class_name LabelComponent

@export var prepend_string: String = "$"
@export var positive_label_settings: LabelSettings
@export var negative_label_settings: LabelSettings = preload("uid://di5o3x4joi7mt")

func get_label_from_int(value: int):
	if value > 0:
		return prepend_string + "+" + str(value)
	elif value < 0:
		return prepend_string +"-" + str(value)
	return prepend_string + "0"

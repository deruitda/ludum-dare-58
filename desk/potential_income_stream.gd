extends Node2D
class_name PotentialIncomeStream

signal potential_income_stream_accepted

func _on_accept_income_stream_button_button_up() -> void:
	potential_income_stream_accepted.emit()

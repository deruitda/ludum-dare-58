extends Control
class_name CapacityRow

func set_income_stream(income_stream: IncomeStream) -> void:
	var length = len(get_children())
	for i in length:
		if income_stream.capacity > i:
			get_children().get(i).visible = true
		else:
			get_children().get(i).visible = false

		

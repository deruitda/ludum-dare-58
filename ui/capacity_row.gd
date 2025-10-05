extends Control
class_name CapacityRow
signal capacity_button_pressed()

@onready var income_stream: IncomeStream

func set_income_stream(new_income_stream: IncomeStream) -> void:
	income_stream = new_income_stream
	refresh_capacity_state()

func refresh_capacity_state() -> void:
	var capacities = income_stream.get_capacities()
	var length = len(get_children())
	for i in length:
		if income_stream.capacity > i:
			var button = get_children().get(i) as Control
			button.visible = true
			button.set_is_taken(len(capacities) > i)
			button.on_capacity_button_press.connect(_on_capacity_button_on_capacity_button_press)
		else:
			get_children().get(i).visible = false


func _on_capacity_button_on_capacity_button_press() -> void:
	capacity_button_pressed.emit()
	pass # Replace with function body.

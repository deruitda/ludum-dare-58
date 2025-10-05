extends Control
class_name CapacityRow
signal capacity_button_pressed(capacity: Capacity)

@onready var income_stream: IncomeStream

func set_income_stream(new_income_stream: IncomeStream) -> void:
	income_stream = new_income_stream
	refresh_capacity_state()

func refresh_capacity_state() -> void:
	var length = len(get_children())
	for i in length:
		if income_stream.capacity > i:
			var button = get_children().get(i) as Control
			button.visible = true
			button.set_capacity(income_stream.get_capacity(i))
			button.on_capacity_button_press.connect(_on_capacity_button_on_capacity_button_press)
		else:
			get_children().get(i).visible = false


func _on_capacity_button_on_capacity_button_press(capacity: Capacity) -> void:
	print("capacity row")
	capacity_button_pressed.emit(capacity)
	pass # Replace with function body.

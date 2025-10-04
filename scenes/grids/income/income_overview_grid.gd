extends ScrollContainer
class_name IncomeOverviewGrid

signal on_detail_button_press(income_stream: IncomeStream)

@onready var income_streams_v_box: VBoxContainer = $IncomeStreamsVBox
const INCOME_DATA_ROW = preload("uid://duwlhtwcqgncq")


func add_row(incomeStream: IncomeStream) -> void:
	var data_row = INCOME_DATA_ROW.instantiate() as IncomeDataRow
	income_streams_v_box.add_child(data_row)
	data_row.set_income_stream(incomeStream)
	data_row.on_detail_button_press.connect(_on_detail_button_press)

func reset() -> void:
	for data_row in income_streams_v_box.get_children():
		data_row.queue_free()
func _on_detail_button_press(income_stream: IncomeStream):
	on_detail_button_press.emit(income_stream)

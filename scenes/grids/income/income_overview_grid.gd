extends ScrollContainer
class_name IncomeOverviewGrid
@onready var income_streams_v_box: VBoxContainer = $IncomeStreamsVBox
const INCOME_DATA_ROW = preload("uid://duwlhtwcqgncq")


func add_row(incomeStream: IncomeStream) -> void:
	var data_row = INCOME_DATA_ROW.instantiate()
	income_streams_v_box.add_child(data_row)
	data_row.set_income_stream(incomeStream)

func reset() -> void:
	for data_row in income_streams_v_box.get_children():
		data_row.queue_free()

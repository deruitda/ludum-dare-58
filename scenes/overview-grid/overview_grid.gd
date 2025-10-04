extends ScrollContainer
@onready var income_streams_v_box: VBoxContainer = $IncomeStreamsVBox
const INCOME_DATA_ROW = preload("uid://duwlhtwcqgncq")

func _ready() -> void:
	var incomeStream = IncomeStream.new()
	incomeStream.income_stream_name = "hello there"
	add_row(incomeStream)
	
	var incomeStream2 = IncomeStream.new()
	incomeStream2.income_stream_name = "test again"
	add_row(incomeStream2)

func add_row(incomeStream: IncomeStream) -> void:
	var data_row = INCOME_DATA_ROW.instantiate()
	data_row.set_income_stream(incomeStream)
	
	income_streams_v_box.add_child(data_row)

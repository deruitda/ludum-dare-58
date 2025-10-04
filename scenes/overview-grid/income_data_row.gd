extends HBoxContainer
class_name IncomeDataRow

var income_stream: IncomeStream

@onready var description_label: Label = $DescriptionLabel
@onready var status_label: Label = $StatusLabel
	
func _ready() -> void:
	description_label.text = self.income_stream.income_stream_name
	
func set_income_stream(income_stream: IncomeStream):
	self.income_stream = income_stream
	

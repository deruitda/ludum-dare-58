extends Node2D
class_name CurrentIndividualIncomeStreamView

@onready var income_stream: IncomeStream
@onready var income_stream_view: IncomeStreamView = $IncomeStreamView

func set_income_stream(new_income_stream: IncomeStream):
	income_stream = new_income_stream
	income_stream_view.set_income_stream(income_stream)

extends Node2D
class_name Binder

@onready var income_streams_page: IncomeStreamsPage = $IncomeStreamsPage
@onready var individual_income_stream_page: IndividualIncomeStreamPage = $IndividualIncomeStreamPage

func reset_pages() -> void:
	income_streams_page.visible = false
	individual_income_stream_page.visible = false

func _on_income_streams_page_on_detail_button_press(income_stream: IncomeStream) -> void:
	reset_pages()
	individual_income_stream_page.set_income_stream(income_stream)
	individual_income_stream_page.visible = true
	pass # Replace with function body.

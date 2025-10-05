extends Node2D
class_name Binder

@onready var income_streams_page: IncomeStreamsPage = $IncomeStreamsPage
@onready var individual_income_stream_page: IndividualIncomeStreamPage = $IndividualIncomeStreamPage
@onready var add_worker_to_capacity_page: AddWorkerToCapacityPage = $AddWorkerToCapacityPage
@onready var workers_page: WorkersPage = $WorkersPage

func reset_pages() -> void:
	income_streams_page.visible = false
	individual_income_stream_page.visible = false
	add_worker_to_capacity_page.visible = false
	workers_page.visible = false
	

func _on_income_streams_page_on_detail_button_press(income_stream: IncomeStream) -> void:
	reset_pages()
	individual_income_stream_page.set_income_stream(income_stream)
	individual_income_stream_page.visible = true

func open_binder():
	reset_pages()
	income_streams_page.refresh()
	income_streams_page.visible = true
	visible = true

func _on_individual_income_stream_page_capacity_button_pressed(income_stream: IncomeStream) -> void:
	reset_pages()
	add_worker_to_capacity_page.load_page(income_stream)
	add_worker_to_capacity_page.visible = true

func _on_add_worker_to_capacity_page_on_back_button_pressed() -> void:
	add_worker_to_capacity_page.visible = false
	individual_income_stream_page.refresh_capacity_state()
	individual_income_stream_page.visible = true

func _on_add_worker_to_capacity_page_on_capacity_created() -> void:
	add_worker_to_capacity_page.visible = false
	individual_income_stream_page.refresh_capacity_state()
	individual_income_stream_page.visible = true

func _on_individual_income_stream_page_back_button_pressed() -> void:
	reset_pages()
	income_streams_page.refresh()
	income_streams_page.visible = true


func _on_income_streams_page_on_workers_button_press() -> void:
	reset_pages()
	workers_page.refresh()
	workers_page.visible = true

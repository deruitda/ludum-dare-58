extends Node2D
class_name Binder

@onready var income_streams_page: IncomeStreamsPage = $IncomeStreamsPage
@onready var individual_income_stream_page: IndividualIncomeStreamPage = $IndividualIncomeStreamPage
@onready var add_worker_to_capacity_page: AddWorkerToCapacityPage = $AddWorkerToCapacityPage
@onready var workers_page: WorkersPage = $WorkersPage
@onready var individual_worker_page: IndividualWorkerPage = $IndividualWorkerPage
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var x_button: TextureButton = $"X-Button"
@onready var table_of_contents: VBoxContainer = $TableOfContents
@onready var workers_button: TextureButton = $TableOfContents/Workers/WorkersButton
@onready var income_streams_button: TextureButton = $TableOfContents/IncomeStreams/IncomeStreamsButton

@onready var last_weeks_report_page: RunningReportPage = $LastWeeksReportPage
@onready var last_weeks_report_button: TextureButton = $TableOfContents/LastWeeksReportRow/LastWeeksReportButton
@onready var last_weeks_report_row: Panel = $TableOfContents/LastWeeksReportRow

var is_open = false

var active_view: Node

func _ready() -> void:
	SignalBus.week_changed.connect(close_book)
	SignalBus.on_week_report_publish.connect(_on_week_report_publish)

func close_book() -> void:
	x_button.visible = false
	x_button.disabled = true
	income_streams_page.visible = false
	individual_income_stream_page.visible = false
	workers_page.visible = false
	individual_worker_page.visible = false
	table_of_contents.visible = false
	
	if is_open:
		animated_sprite_2d.play("lower")
	
	is_open = false

func reset_pages() -> void:
	
	if active_view == null:
		active_view = income_streams_page
	
	table_of_contents.visible = false
	active_view.visible = false
	income_streams_page.visible = false
	individual_income_stream_page.visible = false
	add_worker_to_capacity_page.visible = false
	workers_page.visible = false
	individual_worker_page.visible = false

func _on_income_streams_page_on_detail_button_press(income_stream: IncomeStream) -> void:
	reset_pages()
	individual_income_stream_page.set_income_stream(income_stream)
	change_page(individual_income_stream_page)

func change_page(new_view_node: Node, forward: bool = true):
	reset_pages()
	active_view = new_view_node
	
	if forward:
		animated_sprite_2d.play("flip_page")
	else:
		animated_sprite_2d.play("flip_back")

func open_binder():
	reset_pages()
	is_open = true
	income_streams_page.refresh()
	income_streams_button.disabled = true
	workers_button.disabled = false
	animated_sprite_2d.play("raise")
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
	change_page(income_streams_page, false)

func _on_workers_page_on_open_worker_page_button_pressed(worker: Worker) -> void:
	reset_pages()
	individual_worker_page.set_worker(worker)
	individual_worker_page.visible = true

func _on_individual_worker_page_on_back_button_pressed() -> void:
	reset_pages()
	workers_page.refresh()
	change_page(workers_page, false)


func _on_animated_sprite_2d_animation_finished() -> void:
	if animated_sprite_2d.animation == "raise":
		active_view = income_streams_page
		active_view.visible = true
		x_button.visible = true
		x_button.disabled = false
		table_of_contents.visible = true
		
	if animated_sprite_2d.animation == "lower":
		visible = false
		SignalBus.binder_lowered.emit()
		
	if animated_sprite_2d.animation == "flip_page" || animated_sprite_2d.animation == "flip_back":
		active_view.visible = true
		x_button.visible = true
		table_of_contents.visible = true
		animated_sprite_2d.play("default")

func _on_x_button_pressed() -> void:
	close_book()


func reset_table_of_contents() -> void:
	income_streams_button.disabled = false
	workers_button.disabled = false
	last_weeks_report_button.disabled = false

func _on_workers_button_pressed() -> void:
	if active_view == workers_page:
		return
	reset_table_of_contents()
	workers_button.disabled = true
	
	reset_pages()
	workers_page.refresh()
	change_page(workers_page)


func _on_income_streams_button_pressed() -> void:
	if active_view == income_streams_page:
		return
	
	reset_table_of_contents()
	income_streams_button.disabled = true
	
	reset_pages()
	income_streams_page.refresh()
	change_page(income_streams_page)


func _on_report_page_button_pressed() -> void:
	if active_view == last_weeks_report_page:
		return
	
	reset_table_of_contents()
	last_weeks_report_button.disabled = true
	
	reset_pages()
	change_page(last_weeks_report_page)

func _on_week_report_publish(running_report: RunningReport):
	last_weeks_report_page.set_running_report(running_report)
	last_weeks_report_row.visible = true

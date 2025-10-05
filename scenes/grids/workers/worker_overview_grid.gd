extends ScrollContainer
class_name WorkerOverviewGrid
@onready var workers_v_box: VBoxContainer = $WorkersVBox
const WORKER_DATA_ROW = preload("uid://bt6ns88810b87")

signal on_details_button_pressed(worker: Worker)

func _ready() -> void:
	reset()

func add_row(worker: Worker, disabled: bool = false) -> void:
	var data_row = WORKER_DATA_ROW.instantiate() as WorkerDataRow
	workers_v_box.add_child(data_row)
	
	data_row.set_worker(worker)
	data_row.set_disabled(disabled)
	data_row.set_danger_on_capacity(disabled)
	
	data_row.on_details_button_pressed.connect(_on_details_button_pressed)

func reset() -> void:
	for data_row in workers_v_box.get_children():
		data_row.queue_free()

func _on_details_button_pressed(worker: Worker) -> void:
	on_details_button_pressed.emit(worker)

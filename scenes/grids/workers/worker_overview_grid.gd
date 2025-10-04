extends ScrollContainer
@onready var workers_v_box: VBoxContainer = $WorkersVBox
const WORKER_DATA_ROW = preload("uid://bt6ns88810b87")


func add_row(worker: Worker) -> void:
	var data_row = WORKER_DATA_ROW.instantiate()
	data_row.set_worker(worker)
	
	workers_v_box.add_child(data_row)

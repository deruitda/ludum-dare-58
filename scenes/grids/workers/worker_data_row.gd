extends HBoxContainer
class_name WorkerDataRow

signal on_details_button_pressed(worker: Worker)

var worker: Worker
@onready var name_label: Label = $NameLabel

	
func _ready() -> void:
	name_label.text = self.worker.worker_name
	
func set_worker(worker: Worker):
	self.worker = worker
	


func _on_details_button_button_up() -> void:
	on_details_button_pressed.emit(worker)

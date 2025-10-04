extends HBoxContainer
class_name WorkerDataRow

var worker: Worker
@onready var name_label: Label = $NameLabel

	
func _ready() -> void:
	name_label.text = self.worker.worker_name
	
func set_worker(worker: Worker):
	self.worker = worker
	

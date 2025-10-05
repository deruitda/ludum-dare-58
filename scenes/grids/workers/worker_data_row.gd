extends HBoxContainer
class_name WorkerDataRow

@onready var details_button: TextureButton = $DetailsButton

const DANGER_LABEL = preload("uid://di5o3x4joi7mt")
const RESUME_LABEL = preload("uid://djkpwc0lasqli")
@onready var capacity_label: Label = $CapacityLabel

signal on_details_button_pressed(worker: Worker)

@onready var worker: Worker
@onready var name_label: Label = $NameLabel

	
func _ready() -> void:
	name_label.text = self.worker.worker_name
	
func set_worker(worker: Worker):
	worker = worker
	
func set_disabled(disabled: bool) -> void:
	details_button.disabled = disabled
	
func set_danger_on_capacity(danger_on_capacity: bool) -> void:
	if danger_on_capacity:
		capacity_label.label_settings = DANGER_LABEL
	else:
		capacity_label.label_settings = RESUME_LABEL
	

func _on_details_button_button_up() -> void:
	on_details_button_pressed.emit(worker)

extends Sprite2D
class_name Phone

@onready var worker_manager: WorkerManager

@export var worker_screen: Control
@export var no_worker_screen: Control

@export var name_value: TextEdit
@export var type_value: TextEdit
@export var cost_value: TextEdit

@onready var current_index: int = 0

@onready var initialized: bool = false

func set_worker_manager(wm: WorkerManager) -> void:
	worker_manager = wm
	if worker_manager.get_number_of_workers() > 0:
		show_worker(worker_manager.get_workers()[0])
		initialized = true
		
	worker_manager.worker_hired.connect(on_worker_hired)


func on_worker_hired(worker: Worker):
	if initialized == false:
		show_worker(worker_manager.get_workers()[0])
		initialized = true
	
func set_has_workers():
	worker_screen.visible = true
	no_worker_screen.visible = false

func show_worker(worker: Worker):
	set_has_workers()
	name_value.text = worker.worker_name
	type_value.text = worker.worker_type.type
	cost_value.text = "$" + str(worker.cost_per_week)

func _on_left_pressed() -> void:
	var number_of_workers = worker_manager.get_number_of_workers()
	if current_index == 0:
		current_index = number_of_workers - 1
	else:
		current_index = current_index - 1
	show_worker(worker_manager.get_workers()[current_index])



func _on_right_pressed() -> void:
	var number_of_workers = worker_manager.get_number_of_workers()
	if current_index == number_of_workers - 1:
		current_index = 0
	else:
		current_index = current_index + 1
	show_worker(worker_manager.get_workers()[current_index])

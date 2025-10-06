extends Control
class_name WorkerActionRow
@onready var give_raise_button: TextureButton = $GiveRaiseButton
@onready var add_to_income_stream_button: TextureButton = $AddToIncomeStreamButton
@onready var relieve_of_all_jobs: TextureButton = $RelieveOfAllJobs

@onready var worker: Worker

signal on_fire_worker_button_pressed
signal on_worker_promoted
signal on_add_to_income_stream_button_pressed
signal on_relieved_of_jobs

func set_worker(new_worker: Worker):
	worker = new_worker
	refresh()
	
func refresh():
	if worker.is_eligable_for_promotion():
		give_raise_button.visible = true
	else:
		give_raise_button.visible = false
	
	if worker.has_full_capacity():
		add_to_income_stream_button.visible = false
	else:
		add_to_income_stream_button.visible = true
	
	if worker.get_current_capacity() > 0:
		relieve_of_all_jobs.visible = true
	else:
		relieve_of_all_jobs.visible = false

func _on_fire_worker_button_button_up() -> void:
	on_fire_worker_button_pressed.emit()

func _on_give_raise_button_button_up() -> void:
	worker.do_promotion()
	on_worker_promoted.emit()

func _on_add_to_income_stream_button_button_up() -> void:
	on_add_to_income_stream_button_pressed.emit()
	pass # Replace with function body.

func _on_relieve_of_all_jobs_button_up() -> void:
	CapacityManager.remove_capacities_by_worker(worker)
	on_relieved_of_jobs.emit()

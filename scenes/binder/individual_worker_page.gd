extends Node2D
class_name IndividualWorkerPage

@onready var worker: Worker

@onready var name_label: Label = $NameLabel
@onready var monthly_respect_value: Label = $MonthlyRespectValue
@onready var monthly_wages_value: Label = $MonthlyWagesValue
@onready var worker_action_row: WorkerActionRow = $WorkerActionRow

signal on_back_button_pressed

func set_worker(new_worker: Worker):
	worker = new_worker
	refresh()
	
func refresh() -> void:
	worker_action_row.set_worker(worker)
	name_label.text = worker.worker_name
	monthly_respect_value.text = str(worker.get_current_weekly_respect_amount())
	monthly_wages_value.text = "$" + str(worker.get_cost_per_week())
func _on_back_button_button_up() -> void:
	on_back_button_pressed.emit()
	pass # Replace with function body.


func _on_worker_action_row_on_fire_worker_button_pressed() -> void:
	GameManager.fire_worker(worker)
	on_back_button_pressed.emit()

func _on_worker_action_row_on_worker_promoted() -> void:
	refresh()
	pass # Replace with function body.

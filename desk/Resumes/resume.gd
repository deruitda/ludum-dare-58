extends Sprite2D

class_name Resume

signal on_hire_button_pressed(worker: Worker)
@onready var worker_view: WorkerView = $WorkerView
@onready var no_resumes_left: Control = $NoResumesLeft


func set_worker(adding_worker: Worker):
	set_resume_screen()
	worker_view.set_worker(adding_worker)
	
func set_resume_screen():
	worker_view.visible = true
	no_resumes_left.visible = false
	
func set_no_resumes_left_screen():
	worker_view.visible = false
	no_resumes_left.visible = true

func _on_worker_view_action_button_pressed(worker: Worker) -> void:
	print('resume')
	on_hire_button_pressed.emit(worker)

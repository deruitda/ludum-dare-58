extends Sprite2D

class_name Resume

signal on_hire_button_pressed()

@onready var resume: Control = $Resume
@onready var no_resumes_left: Control = $NoResumesLeft

@export var name_value: TextEdit
@export var type_value: TextEdit
@export var cost_value: TextEdit

func set_worker(adding_worker: Worker):
	set_resume_screen()
	name_value.text = adding_worker.worker_name
	type_value.text = adding_worker.worker_type.type
	cost_value.text = "$" + str(adding_worker.cost_per_week)
	
func set_resume_screen():
	resume.visible = true
	no_resumes_left.visible = false
	
func set_no_resumes_left_screen():
	resume.visible = false
	no_resumes_left.visible = true


func _on_hire_button_button_up() -> void:
	print("hiya")
	on_hire_button_pressed.emit()

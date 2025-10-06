extends AnimatedSprite2D

class_name Offer
@onready var worker_view: WorkerView = $WorkerView
@onready var income_stream_view: IncomeStreamView = $IncomeStreamView

var isWorker : bool = false

signal offer_anim_done()

func show_worker_offer(worker: Worker) -> void:
	isWorker = true
	worker_view.set_worker(worker)
	show_offer()
	pass
	
func show_income_offer(incomeStream: IncomeStream) -> void:
	isWorker = false
	income_stream_view.set_income_stream(incomeStream)
	show_offer()
	pass	

func show_offer() -> void:
	play("show")
	
func hide_offer() -> void:
	income_stream_view.visible = false
	worker_view.visible = false
	play("hide")
	

func _on_animation_finished() -> void:
	offer_anim_done.emit()
	if animation == "show":
		if isWorker:
			income_stream_view.visible = false
			worker_view.visible = true

		if !isWorker:
			income_stream_view.visible = true
			worker_view.visible = false
			

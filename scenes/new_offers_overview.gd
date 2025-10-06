extends Control

class_name Offer
@onready var worker_view: WorkerView = $WorkerView
@onready var income_stream_view: IncomeStreamView = $IncomeStreamView
@onready var accept_income_stream_button: TextureButton = $AcceptIncomeStreamButton
@onready var hire_worker_button: TextureButton = $HireWorkerButton
@onready var animation: AnimatedSprite2D = $Animation
var income_stream: IncomeStream
var worker_data: Worker
var isWorker : bool = false
var isAccepted: bool = false

func show_worker_offer(worker: Worker) -> void:
	isWorker = true
	worker_data = worker
	
	show_offer()
	pass
	
func show_income_offer(incomeStream: IncomeStream) -> void:
	isWorker = false
	
	income_stream = incomeStream
	show_offer()
	pass	

func show_offer() -> void:
	if !isWorker:
		income_stream_view.set_income_stream(income_stream)
	else: 
		worker_view.set_worker(worker_data)
		
	animation.play("show")
	
func hide_offer() -> void:
	
	# shit hack to re-trigger animation complete event for the caller
	if animation.animation == "empty" && isAccepted:
		SignalBus.offer_anim_done.emit()
		return
	
	income_stream_view.visible = false
	worker_view.visible = false
	accept_income_stream_button.visible = false
	hire_worker_button.visible = false
	animation.play("hide")
	

func _on_animation_finished() -> void:
	SignalBus.offer_anim_done.emit()
	if animation.animation == "show":
		if isWorker:
			accept_income_stream_button.visible = false
			hire_worker_button.visible = true
			income_stream_view.visible = false
			worker_view.visible = true

		if !isWorker:
			accept_income_stream_button.visible = true
			hire_worker_button.visible = false
			income_stream_view.visible = true
			worker_view.visible = false
			
	if animation.animation == "hide":
		animation.play("empty")


func _on_accept_income_stream_button_pressed() -> void:
	PotentialIncomeStreamManager.accept_income_stream(income_stream)
	SignalBus.offer_accepted.emit(income_stream)
	isAccepted = true
	hide_offer()

func _on_hire_worker_button_pressed() -> void:
	WorkerManager.hire_worker(worker_data)
	SignalBus.offer_accepted.emit(worker_data)
	isAccepted = true
	hide_offer()

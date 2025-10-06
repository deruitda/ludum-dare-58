extends Control
class_name OfferSimple
@onready var income_stream_view: IncomeStreamView = $IncomeStreamView
@onready var worker_view: WorkerView = $WorkerView
@onready var accept_income_stream_button: TextureButton = $AcceptIncomeStreamButton
@onready var hire_worker_button: TextureButton = $HireWorkerButton
var income_stream: IncomeStream
var worker_data: Worker
var isWorker : bool = false
var isAccepted: bool = false

func _ready() -> void:
	SignalBus.offers_closed.connect(hide_offer)
	SignalBus.week_changed.connect(reset_state)

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
		income_stream_view.visible = true
		accept_income_stream_button.visible = true
		worker_view.visible = false
		hire_worker_button.visible = false
	else: 
		worker_view.set_worker(worker_data)
		worker_view.visible = true
		hire_worker_button.visible = true
		
		income_stream_view.visible = false
		accept_income_stream_button.visible = false
	visible = true
	
	
func reset_state() -> void:
	isAccepted = false
	visible = false
	income_stream_view.visible = false
	worker_view.visible = false
	accept_income_stream_button.visible = false
	hire_worker_button.visible = false
	

func hide_offer() -> void:
	visible = false
	income_stream_view.visible = false
	worker_view.visible = false
	accept_income_stream_button.visible = false
	hire_worker_button.visible = false

func _on_accept_income_stream_button_pressed() -> void:
	isAccepted = true
	PotentialIncomeStreamManager.accept_income_stream(income_stream)
	SignalBus.offer_accepted.emit(income_stream)
	hide_offer()

func _on_hire_worker_button_pressed() -> void:
	isAccepted = true
	CandidateManager.hire_worker(worker_data)
	SignalBus.offer_accepted.emit(worker_data)
	hide_offer()

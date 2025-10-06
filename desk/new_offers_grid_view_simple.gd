extends Control

@export var offers : Array[OfferSimple]

func _ready() -> void:
	SignalBus.offer_accepted.connect(offer_accepted)
	SignalBus.offers_button_press_done.connect(show_offer_view)
	
func offer_accepted(offer: Variant):
	
	# if we have any un-accepted offers we can return out
	for offer_guy in offers:
		if !offer_guy.isAccepted:
			return
			
	SignalBus.offers_all_closed.emit()
	close_offer_view()
	
func is_offer_accepted(offer: Offer) -> bool:
	return offer.isAccepted
	
func close_offer_view() -> void:
	visible = false
	SignalBus.offers_closed.emit()
	
func _on_close_offers_pressed() -> void:
	close_offer_view()

func show_offer_view() -> void:
	visible = true
	
	var potential_income_offers = PotentialIncomeStreamManager.get_potential_income_streams()
	
	var index = 0
	for potential_income in potential_income_offers:
		# hardcoding this so we can have max two potential incomes
		if index > 1:
			break
		offers[index].show_income_offer(potential_income)
		index += 1
		
	var potential_workers = CandidateManager.get_hierable_workers()
	
	index = 2
	for potential_worker in potential_workers:
		# hardcoding this so we can have max two potential incomes
		if index > 3:
			break
		offers[index].show_worker_offer(potential_worker)
		index += 1
	

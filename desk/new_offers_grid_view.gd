extends Control

@export var offers : Array[Offer]
@onready var close_offers: TextureButton = $CloseOffers
@onready var new_offers_views: HBoxContainer = $NewOffersViews
const OFFER = preload("uid://nu1tyw2jv5yg")



var is_closing_offers: bool = false
var potential_income_streams : Array[IncomeStream]
var curr_offer_index = 0

func _ready() -> void:
	SignalBus.offer_accepted.connect(remove_offer_view)
	SignalBus.offers_button_press_done.connect(_on_new_offers_offers_button_press_done)
	SignalBus.offer_anim_done.connect(_on_new_offer_offer_anim_done)

func remove_offer_view(acceptedOfferType: Variant) -> void:
	for offer in offers:
		if acceptedOfferType is Worker:
			if offer.worker_data.name == acceptedOfferType.name:
				offer.visible = false
		if acceptedOfferType is IncomeStream:
			if offer.income_stream.name == acceptedOfferType.name:
				offer.visible = false

func _on_new_offers_offers_button_press_done() -> void:
	potential_income_streams = PotentialIncomeStreamManager.get_potential_income_streams()
	
	var index = 0
	for stream in potential_income_streams:
		offers[index].show_income_offer(stream)
		index += 1
	
	close_offers.visible = true
	visible = true
	curr_offer_index = 0

func _on_new_offer_offer_anim_done() -> void:
	curr_offer_index += 1
	
	# we've animated all our offers
	if curr_offer_index >= len(offers):
		
		# put the offers back on the table
		if is_closing_offers:
			visible = false
			SignalBus.offers_closed.emit()
		
		close_offers.visible = !is_closing_offers
		is_closing_offers = false
		return
		
	if !is_closing_offers:
		offers[curr_offer_index].show_income_offer(potential_income_streams[curr_offer_index])
	else:
		offers[curr_offer_index].hide_offer()


func _on_close_offers_pressed() -> void:
	close_offers.visible = false
	is_closing_offers = true
	curr_offer_index = 0
	offers[curr_offer_index].hide_offer()

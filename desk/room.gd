extends Node2D
class_name Room

@onready var binder: Binder = $Binder
@onready var week_label: Label = $WeekLabel
@onready var new_offers_views: HBoxContainer = $NewOffersViews
@export var offers : Array[Offer]
@onready var close_offers: TextureButton = $CloseOffers
@onready var new_offers_button: AnimatedSprite2D = $NewOffers

var is_closing_offers: bool = false
var potential_income_streams : Array[IncomeStream]
var curr_offer_index = 0

func _ready() -> void:
	set_week_label()

func _on_progress_button_click() -> void:
	GameManager.progress_to_next_week()
	set_week_label()
	pass # Replace with function body.

func set_week_label() -> void:
	if week_label:
		week_label.text = "Week " + str(GameState.current_week)

func _on_binder_button_button_pressed() -> void:
	binder.open_binder()
	pass # Replace with function body.


func _on_new_offers_offers_button_press_done() -> void:
	potential_income_streams = PotentialIncomeStreamManager.get_potential_income_streams()
	
	new_offers_views.visible = true
	curr_offer_index = 0
	offers[curr_offer_index].show_income_offer(potential_income_streams[curr_offer_index])

func _on_new_offer_offer_anim_done() -> void:
	curr_offer_index += 1
	
	# we've animated all our offers
	if curr_offer_index >= len(offers):
		
		# put the offers back on the table
		if is_closing_offers:
			new_offers_views.visible = false
			new_offers_button.place_offers()
		
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

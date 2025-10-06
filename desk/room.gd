extends Node2D
class_name Room

@onready var binder: Binder = $Binder
@onready var week_label: Label = $WeekLabel
@onready var close_offers: TextureButton = $CloseOffers
@onready var new_offers_button: AnimatedSprite2D = $NewOffers

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

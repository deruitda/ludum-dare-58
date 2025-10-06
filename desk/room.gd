extends Node2D
class_name Room

@onready var binder: Binder = $Binder
@onready var week_label: Label = $WeekLabel
@onready var close_offers: TextureButton = $CloseOffers
@onready var money_counter: MoneyCounter = $Background/MoneyCounter
@export var disable_things: Control

func _ready() -> void:
	SignalBus.week_changed.connect(trigger_week_change)
	set_week_label()

func set_week_label() -> void:
	if week_label:
		week_label.text = "Week " + str(GameState.current_week)

func _on_binder_button_button_pressed() -> void:
	binder.open_binder()
	pass # Replace with function body.
	
func trigger_week_change() -> void:
	disable_things.visible = true
	money_counter.play("count")
	
func end_week_change() -> void:
	disable_things.visible = false
	money_counter.play("default")


func _on_money_counter_animation_finished() -> void:
	if money_counter.animation == "count":
		end_week_change()

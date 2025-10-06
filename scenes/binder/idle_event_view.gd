extends Control
class_name IdleEventView
@onready var name_label: Label = $NameLabel
@onready var cost_to_attempt_to_resolve: Label = $CostToAttemptToResolve
@onready var percentage_label: PercentageLabel = $HBoxContainer3/PercentageLabel
@onready var description_label: Label = $DescriptionLabel

@onready var idle_event: IdleEvent
@onready var attempt_to_resolve_button: Button = $HBoxContainer/AttemptToResolveButton
@onready var attempt_to_resolve_cost_view: CostView = $HBoxContainer/AttemptToResolveCostView
@onready var abandon_button: Button = $HBoxContainer2/AbandonButton
@onready var abandon_cost_view: CostView = $HBoxContainer2/AbandonCostView



signal on_attempt_to_resolve_button_pressed
signal on_abandon_button_pressed

func set_idle_event(new_idle_event: IdleEvent) -> void:
	idle_event = new_idle_event
	name_label.text = idle_event.idle_event_name
	description_label.text = idle_event.idle_description
	percentage_label.set_percentage(idle_event.chance_of_failure)
	
	attempt_to_resolve_cost_view.set_cost(idle_event.attempt_to_resolve_cost)
	abandon_cost_view.set_cost(idle_event.abandon_cost)
	
	attempt_to_resolve_button.text = idle_event.attempt_button_label
	abandon_button.text = idle_event.abandon_button_label

func _on_attempt_to_resolve_button_button_up() -> void:
	on_attempt_to_resolve_button_pressed.emit()

func _on_abandon_button_button_up() -> void:
	on_abandon_button_pressed.emit()

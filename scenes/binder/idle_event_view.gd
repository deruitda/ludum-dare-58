extends Control
class_name IdleEventView
@onready var name_label: Label = $Idle/NameLabel
@onready var description_label: Label = $Idle/DescriptionLabel
@onready var cost_to_attempt_to_resolve: Label = $Idle/CostToAttemptToResolve
@onready var percentage_label: PercentageLabel = $Idle/PercentageLabel

@onready var idle_event: IdleEvent

@onready var attempt_to_resolve_button: Button = $Idle/AttemptToResolveButton
@onready var abandon_button: Button = $Idle/AbandonButton

signal on_attempt_to_resolve_button_pressed
signal on_abandon_button_pressed

func set_idle_event(new_idle_event: IdleEvent) -> void:
	idle_event = new_idle_event
	name_label.text = idle_event.idle_event_name
	description_label.text = idle_event.idle_description
	cost_to_attempt_to_resolve.text = "$" + str(idle_event.cost_to_attempt_to_resolve)
	percentage_label.set_percentage(idle_event.chance_of_failure)
	


func _on_attempt_to_resolve_button_button_up() -> void:
	on_attempt_to_resolve_button_pressed.emit()

func _on_abandon_button_button_up() -> void:
	on_abandon_button_pressed.emit()

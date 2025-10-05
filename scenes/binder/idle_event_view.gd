extends Control
class_name IdleEventView
@onready var name_label: Label = $Idle/NameLabel
@onready var description_label: Label = $Idle/DescriptionLabel
@onready var cost_to_attempt_to_resolve: Label = $Idle/CostToAttemptToResolve
@onready var chance_of_failure: Label = $Idle/ChanceOfFailure

@onready var idle_event: IdleEvent

func set_idle_event(new_idle_event: IdleEvent) -> void:
	idle_event = new_idle_event
	name_label.text = idle_event.idle_event_name
	description_label.text = idle_event.idle_description
	cost_to_attempt_to_resolve.text = "$" + str(idle_event.cost_to_attempt_to_resolve)
	chance_of_failure.text = str(idle_event.chance_of_failure) + "%"

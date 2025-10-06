extends Resource
class_name PotentialIdleEventsResource

@export var idle_event_name: String = ""
@export var idle_description: String = ""
@export var chance_of_failure: Enums.Intensity

@export var attempt_to_resolve_cost: CostResource
@export var abandon_cost: CostResource

@export var attempt_button_label: String = "Attempt to Resolve"
@export var abandon_button_label: String = "Abandon Job"

@export var loses_worker_on_abandon: bool = false

@export var attempt_failed_message: String
@export var attempt_successful_message: String

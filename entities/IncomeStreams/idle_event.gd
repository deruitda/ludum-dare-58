extends Node
class_name IdleEvent

@export var idle_event_name: String = ""
@export var idle_description: String = ""
@export var chance_of_failure: float = .5

@export var attempt_to_resolve_cost: Cost
@export var succeed_cost: Cost
@export var abandon_cost: Cost

@export var attempt_button_label: String = "Attempt to Resolve"
@export var abandon_button_label: String = "Abandon Job"

@export var attempt_failed_message: String
@export var attempt_successful_message: String


func roll_dice_for_resolve() -> bool:
	var roll = randf()
	return roll > chance_of_failure

func set_attempt_to_resolve_cost(cost: Cost):
	attempt_to_resolve_cost = cost
	add_child(attempt_to_resolve_cost)
	
func set_succeed_cost(cost: Cost):
	succeed_cost = cost
	add_child(succeed_cost)

func set_abandon_cost(cost: Cost):
	abandon_cost = cost
	add_child(abandon_cost)

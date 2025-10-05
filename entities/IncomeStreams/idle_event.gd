extends Node
class_name IdleEvent

@export var idle_event_name: String = ""
@export var chance_of_failure: float = .5
@export var idle_description: String = ""
@export var cost_to_attempt_to_resolve: int = 15
	
func roll_dice_for_resolve() -> bool:
	var roll = randf()
	return roll > chance_of_failure

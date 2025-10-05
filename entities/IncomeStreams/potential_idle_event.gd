extends Node

class_name PotentialIdleEvent

@export var idle_event_name: String = ""
@export var chance_of_failure: float = .5
@export var status: String = "unresolved"
@export var idle_description: String = ""

@export var type: String

func attempt_to_resolve(fail_chance: float) -> bool:
	var roll = randf()
	if roll < fail_chance:
		status = "failed"
		return false
	else:
		status = "succeeded"
		return true

	

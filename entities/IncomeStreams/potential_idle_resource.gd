extends Resource
class_name PotentialIdleEventsResource

@export var idle_event_name: String = ""
@export var chance_to_idle: float = .5
@export var status: String = "active"
@export var idle_description: String = ""

func attempt_to_resolve(fail_chance: float) -> bool:
	var roll = randf()
	if roll < fail_chance:
		status = "failed"
		return false
	else:
		status = "succeeded"
		return true

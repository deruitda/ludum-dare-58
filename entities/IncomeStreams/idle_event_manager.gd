extends Node

@export var current_idle_event: IdleEvent

func has_idle_event() -> bool:
	return (current_idle_event == null) == false

func create_idle_event_from_potential_idle_events(potential_idle_events: Array[PotentialIdleEventsResource]):
	var potential_idle_event = potential_idle_events.pick_random()
	current_idle_event = IdleEvent.new()
	add_child(current_idle_event)
	
	current_idle_event.idle_event_name = potential_idle_event.idle_event_name
	current_idle_event.chance_of_failure = potential_idle_event.chance_of_failure
	current_idle_event.idle_description = potential_idle_event.idle_description

func remove_idle_event() -> void:
	current_idle_event.queue_free()
	current_idle_event = null

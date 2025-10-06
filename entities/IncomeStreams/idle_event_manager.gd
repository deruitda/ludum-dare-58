extends Node

class_name IdleEventManager

@export var income_stream: IncomeStream
@export var current_idle_event: IdleEvent
@onready var has_attempted_success_this_week = false
@onready var attempt_successful_message: String
@onready var active_worker: Worker

func _ready() -> void:
	SignalBus.week_changed.connect(_on_week_changed)

func _on_week_changed() -> void:
	has_attempted_success_this_week = false

func has_idle_event() -> bool:
	return (current_idle_event == null) == false

func create_idle_event_from_potential_idle_events(potential_idle_events: Array[PotentialIdleEventsResource]):
	var potential_idle_event = potential_idle_events.pick_random()
	current_idle_event = IdleEvent.new()
	add_child(current_idle_event)
	
	current_idle_event.idle_event_name = potential_idle_event.idle_event_name
	current_idle_event.chance_of_failure = Enums.get_percentage_rate_from_intensity(potential_idle_event.chance_of_failure)
	current_idle_event.idle_description = potential_idle_event.idle_description
	
	current_idle_event.set_attempt_to_resolve_cost(potential_idle_event.attempt_to_resolve_cost.calculate_new_cost())
	current_idle_event.set_abandon_cost(potential_idle_event.abandon_cost.calculate_new_cost())
	
	current_idle_event.abandon_button_label = add_variable_strings(potential_idle_event.abandon_button_label)
	current_idle_event.attempt_button_label = add_variable_strings(potential_idle_event.attempt_button_label)
	
	attempt_successful_message = potential_idle_event.attempt_successful_message

func add_variable_strings(value: String) -> String:
	if not income_stream.subject_name == "":
		value = StringHelper.replace_all(value, "{subject_name}", income_stream.subject_name)
		value = StringHelper.replace_all(value, "{worker_name}", income_stream.subject_name)
	return value

func attempt_to_resolve():
	if roll_dice_for_resolve():
		remove_idle_event()
	
	has_attempted_success_this_week = true

func remove_idle_event() -> void:
	current_idle_event.queue_free()
	current_idle_event = null

func get_idle_event() -> IdleEvent:
	return current_idle_event

func roll_dice_for_resolve() -> bool:
	return current_idle_event.roll_dice_for_resolve()

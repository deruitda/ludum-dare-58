extends Node
class_name IncomeStream

@export var income_stream_name: String = ""
@export var description: String = ""

@export var initial_cost: Cost
@export var completed_return_cost: Cost
@export var weekly_return_cost: Cost

@export var duration_in_weeks: int = 10

@onready var active_weeks_transpired: int = 0
@export var type: IncomeStreamTypeResource

@export var completed_respect_payout: int = 0

@export var capacity: int = 1
@export var accepted_worker_types: Array[WorkerTypeResource] = []
@export var percent_chance_of_event: float = 0.5

@onready var idle_event_manager: IdleEventManager = $IdleEventManager

func is_idle() -> bool:
	if not has_full_capacity():
		return true
	if has_idle_event():
		return true
	
	return false

func set_initial_cost(cost: Cost):
	initial_cost = cost
	add_child(initial_cost)
	
func set_completed_return_cost(cost: Cost):
	completed_return_cost = cost
	add_child(completed_return_cost)
func set_weekly_return_cost(cost: Cost):
	weekly_return_cost = cost
	add_child(weekly_return_cost)

func has_idle_event() -> bool:
	return idle_event_manager.has_idle_event()
	
func roll_dice_for_event() -> bool:
	var roll = randf()
	return roll < percent_chance_of_event
					
func create_random_idle_event() -> void:
	idle_event_manager.create_idle_event_from_potential_idle_events(type.potential_idle_events)

func get_weeks_left() -> int:
	return duration_in_weeks - active_weeks_transpired

func get_capacities() -> Array[Capacity]:
	return CapacityManager.get_capacities_by_income_stream(self)

func get_current_capacity() -> int:
	return len(CapacityManager.get_capacities_by_income_stream(self))
	
func has_full_capacity() -> bool:
	return get_current_capacity() == capacity

func increment_week() -> void:
	active_weeks_transpired = active_weeks_transpired + 1

func is_completed() -> bool:
	return active_weeks_transpired == duration_in_weeks

func get_idle_event() -> IdleEvent:
	if has_idle_event():
		return idle_event_manager.get_idle_event()
	return

func attempt_to_resolve_idle_event() -> void:
	idle_event_manager.attempt_to_resolve()
	
	
	

extends Node
class_name Cost

@onready var cost: int = 0
@onready var respect: int = 0

func set_cost(new_cost: int) -> void:
	cost = new_cost
	
func set_respect(new_respect: int) -> void:
	respect = new_respect

func add_to_cost(adding_cost: Cost) -> void:
	cost = cost + adding_cost.cost
	respect = respect + adding_cost.respect

func get_only_positive_cost() -> Cost:
	var return_cost = Cost.new()
	if cost > 0:
		return_cost.set_cost(cost)
	if respect > 0:
		return_cost.set_respect(respect)
	return return_cost

func get_only_negative_cost() -> Cost:
	var return_cost = Cost.new()
	if cost < 0:
		return_cost.set_cost(cost)
	if respect < 0:
		return_cost.set_respect(respect)
	return return_cost

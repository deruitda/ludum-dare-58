extends Node
class_name Cost

@onready var cost: int
@onready var respect: int

func set_cost(new_cost: int) -> void:
	cost = new_cost
	
func set_respect(new_respect: int) -> void:
	respect = new_respect

extends Control
class_name CostView

@export var money_label: Label
@export var respect_label: Label

@onready var cost: Cost

func set_cost(new_cost: Cost):
	cost = new_cost
	refresh()

func refresh() -> void:
	money_label.set_value(cost.cost)
	respect_label.set_value(cost.respect)

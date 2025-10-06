extends Control
class_name CostView

@export var money_label: Label
@export var respect_label: Label
@export var none_label: Label

@onready var cost: Cost

func set_cost(new_cost: Cost):
	cost = new_cost
	refresh()

func refresh() -> void:
	money_label.set_value(cost.cost)
	respect_label.set_value(cost.respect)
	
	money_label.visible = false
	respect_label.visible = false
	none_label.visible = false

	if cost.cost == 0 && cost.respect == 0:
		none_label.visible = true
	if (cost.cost == 0) == false:
		money_label.visible = true
	if (cost.respect == 0) == false:
		respect_label.visible = true

extends Sprite2D
class_name MoneyCounter

@export var money_label: Label

func _ready() -> void:
	on_money_changed()
	SignalBus.money_changed.connect(on_money_changed)
	
func on_money_changed() -> void:
	money_label.text = "$" + str(GameState.total_money)
